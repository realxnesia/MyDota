//
//  ViewController.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var collectionList: UICollectionView!
    
    //MARK: - Related to Dummy Data 
    let fullDetailHero = localData.intializeData()
    
    //MARK: - Related to API Request from Button in Table View
    let roles = ["Carry", "Disabler", "Durable", "Escape", "Initiator", "Jungler", "Nuker", "Pusher", "Support", "All Hero"]
    var heroesFiltered = [String]()
    var tempHeroesImage = [String]()
    var navTitle: String?
    
    var tempRole = [String]()
    var tempBaseAttackMin =  [Int]()
    var tempBaseAttackMax = [Int]()
    var tempBaseArmor = [Double]()
    var tempMoveSpeed = [Int]()
    var tempBaseHealth = [Int]()
    var tempBaseMana = [Int]()
    var tempAtribute = [String]()
    
    //MARK: - Related to Core Data
    let database = DatabaseHandler()
    var dataHeroFromSplash = [HeroesEntity]()
    var dataRoleFromSplash = [RoleEntity]()
    var dataSavedFromCoreData = [HeroesEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableList.delegate = self
        tableList.dataSource = self
        collectionList.delegate = self
        collectionList.dataSource = self
        configureView()
        configureCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)
   }

   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       AppUtility.lockOrientation(.all)
   }
    
    private func configureCell(){
        tableList.register(ButtonRolesTVCell.nib(), forCellReuseIdentifier: ButtonRolesTVCell.identifier)
        tableList.register(AltButtonRolesTVCell.nib(), forCellReuseIdentifier: AltButtonRolesTVCell.identifier)
        collectionList.register(HeroCVCell.nib(), forCellWithReuseIdentifier: HeroCVCell.identifier)
    }
    
    private func configureView(){
        let unwrapTitle = navTitle ?? "All Hero"
        self.navigationItem.title = unwrapTitle
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.tableList.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
        
}

//MARK: - TableView Button Role Heroes
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ButtonRolesTVCell.identifier, for: indexPath) as! ButtonRolesTVCell
        
        cell.configureData(with: roles[indexPath.row])
        cell.delegate = self
        cell.navDelegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableList.deselectRow(at: indexPath, animated: true)
    }
}


//MARK: - Collection view Heroes
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return heroesFiltered.count //MARK: ini udah bener
        //dataHeroFromSplash.count
        if heroesFiltered.count != 0{
            //MARK: Get data From API
            return heroesFiltered.count
        }else{
            //MARK: Get data From Core Data
            return dataHeroFromSplash.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let heroCell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCVCell.identifier, for: indexPath) as! HeroCVCell
        
        if heroesFiltered.count != 0{
            //MARK: Fetch data From API
            if let url = URL(string: APIConstant.BASE_URL + tempHeroesImage[indexPath.row]){
                heroCell.heroImageView.load(url: url)
            }
            heroCell.heroNameLabel.text = heroesFiltered[indexPath.row]
        }else{
            //MARK: Fetch data From Core Data
            self.dataSavedFromCoreData = self.database.fetch(HeroesEntity.self)
            if let url = URL(string: APIConstant.BASE_URL + dataSavedFromCoreData[indexPath.row].img!){
                heroCell.heroImageView.load(url: url)
            }
            heroCell.heroNameLabel.text = dataHeroFromSplash[indexPath.row].localizedName
        }
        
        return heroCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = HeroDetailViewController()
        
        //MARK: Send Data to HeroDetailViewController()
        if heroesFiltered.count != 0{
            //MARK: Get data From API
            vc.heroName = heroesFiltered[indexPath.row]
            vc.heroRoles = [tempRole[indexPath.row]]
            vc.heroImage = tempHeroesImage[indexPath.row]
            
            vc.baseAttackMin = tempBaseAttackMin[indexPath.row]
            vc.baseAttackMax = tempBaseAttackMax[indexPath.row]
            vc.baseArmor = tempBaseArmor[indexPath.row]
            vc.moveSpeed = tempMoveSpeed[indexPath.row]
            vc.baseHealth = tempBaseHealth[indexPath.row]
            vc.baseMana = tempBaseMana[indexPath.row]
            vc.atributeType = tempAtribute[indexPath.row]
            navigationController?.pushViewController(vc, animated: false)
        }else{
            //MARK: Get data From Core Data
            vc.heroName = dataSavedFromCoreData[indexPath.row].localizedName
            //vc.heroRoles = dataSavedFromCoreData[indexPath.row].roles[0]
            vc.heroImage = dataSavedFromCoreData[indexPath.row].img!
            vc.baseAttackMin = Int(dataSavedFromCoreData[indexPath.row].baseAttackMin)
            vc.baseAttackMax = Int(dataSavedFromCoreData[indexPath.row].baseAttackMax)
            vc.baseArmor = dataSavedFromCoreData[indexPath.row].baseArmor
            vc.moveSpeed = Int(dataSavedFromCoreData[indexPath.row].moveSpeed)
            vc.baseHealth = Int(dataSavedFromCoreData[indexPath.row].baseHealth)
            vc.baseMana = Int(dataSavedFromCoreData[indexPath.row].baseMana)
            vc.atributeType = dataSavedFromCoreData[indexPath.row].primaryAttr
            navigationController?.pushViewController(vc, animated: false)
        }
    }
}

extension ViewController: titleLabelDelegate{
    func roleButtonTapped(with title: String) {
        navigationItem.title = title
    }
}

extension ViewController: NavigationDelegate{
    func navigationToMainVC(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: false)
    }
}
