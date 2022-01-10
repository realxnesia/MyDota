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
    
    

    let fullDetailHero = localData.intializeData() //Dummy hero -> tidak digunakan lagi
    let roles = ["Carry", "Disabler", "Durable", "Escape", "Initiator", "Jungler", "Nuker", "Pusher", "Support", "All Hero"]
    var heroesFiltered = [String]()
    var heroesImage: String?
    var homeTitle: String?
    private var models: [Codable] = []
    
    
    var tempRole = [String]()
    var tempBaseAttackMin =  [Int]()
    var tempBaseAttackMax = [Int]()
    var tempBaseArmor = [Double]()
    var tempMoveSpeed = [Int]()
    var tempBaseHealth = [Int]()
    var tempBaseMana = [Int]()
    var tempAtribute = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableList.delegate = self
        tableList.dataSource = self
        collectionList.delegate = self
        collectionList.dataSource = self
        configureView()
        configureCell()
    }
    
    private func configureCell(){
        tableList.register(ButtonRolesTVCell.nib(), forCellReuseIdentifier: ButtonRolesTVCell.identifier)
        tableList.register(AltButtonRolesTVCell.nib(), forCellReuseIdentifier: AltButtonRolesTVCell.identifier)
        collectionList.register(HeroCVCell.nib(), forCellWithReuseIdentifier: HeroCVCell.identifier)
    }
    
    private func configureView(){
        let unwrapTitle = homeTitle ?? "All Hero"
        self.navigationItem.title = unwrapTitle
        self.navigationItem.setHidesBackButton(true, animated: true)
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


//MARK: Collection view Heroes
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return heroesFiltered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let heroCell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCVCell.identifier, for: indexPath) as! HeroCVCell
        
        heroCell.heroNameLabel.text = heroesFiltered[indexPath.row]
        
        return heroCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = HeroDetailViewController()
        //MARK: Send Data to HeroDetailViewController()
        vc.heroName = heroesFiltered[indexPath.row]
        vc.heroRoles = [tempRole[indexPath.row]]
        
        vc.baseAttackMin = tempBaseAttackMin[indexPath.row]
        vc.baseAttackMax = tempBaseAttackMax[indexPath.row]
        vc.baseArmor = tempBaseArmor[indexPath.row]
        vc.moveSpeed = tempMoveSpeed[indexPath.row]
        vc.baseHealth = tempBaseHealth[indexPath.row]
        vc.baseMana = tempBaseMana[indexPath.row]
        vc.atributeType = tempAtribute[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: false)
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

// /apps/dota2/images/dota_react/heroes/antimage.png?





