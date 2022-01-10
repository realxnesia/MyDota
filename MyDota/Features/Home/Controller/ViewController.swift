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
    
    
    //MARK: - Dummy Here
    let fullDetailHero = localData.intializeData()
    let roles = ["Carry", "Disabler", "Durable", "Escape", "Initiator", "Jungler", "Nuker", "Pusher", "Support", "All Hero"]
    var heroesFiltered = [String]()
    var homeTitle: String?
    private var models: [Codable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableList.delegate = self
        tableList.dataSource = self
        collectionList.delegate = self
        collectionList.dataSource = self
        configureView()
        configureCell()
        print(heroesFiltered.count)
    }
    
    func configureCell(){
        tableList.register(ButtonRolesTVCell.nib(), forCellReuseIdentifier: ButtonRolesTVCell.identifier)
        tableList.register(AltButtonRolesTVCell.nib(), forCellReuseIdentifier: AltButtonRolesTVCell.identifier)
        collectionList.register(HeroCVCell.nib(), forCellWithReuseIdentifier: HeroCVCell.identifier)
    }
    
    func configureView(){
        let unwrapTitle = homeTitle ?? "All Hero"
        self.navigationItem.title = unwrapTitle
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
        
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ////https://stackoverflow.com/questions/64597593/append-object-if-not-exist-swift
        let cell = tableView.dequeueReusableCell(withIdentifier: ButtonRolesTVCell.identifier, for: indexPath) as! ButtonRolesTVCell
        cell.configureData(with: roles[indexPath.row])
        cell.delegate = self
        cell.navDelegate = self
        
//        cell.navTitleDelegate = self
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableList.deselectRow(at: indexPath, animated: true)
            
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return fullDetailHero.count
        
        //Return jumlah data yg disimpan
        return heroesFiltered.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let heroCell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCVCell.identifier, for: indexPath) as! HeroCVCell
        //heroCell.configureData(with: fullDetailHero[indexPath.row])
        heroCell.heroNameLabel.text = heroesFiltered[indexPath.row]
        
        //parsing data dan di load
        return heroCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = HeroDetailViewController()
         vc.nameTemp = fullDetailHero[indexPath.row].name
        vc.roleTemp = fullDetailHero[indexPath.row].role
        vc.attackTemp = fullDetailHero[indexPath.row].attack
        vc.defendTemp = fullDetailHero[indexPath.row].defend
        vc.speedTemp = fullDetailHero[indexPath.row].speed
        vc.hpTemp = fullDetailHero[indexPath.row].hp
        vc.regenTemp = fullDetailHero[indexPath.row].regen
        vc.typeTemp = fullDetailHero[indexPath.row].type
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ViewController: MyTableViewCellDelegate{
    func roleButtonTapped(with title: String) {
        navigationItem.title = title
    }
}

extension ViewController: NavigationDelegate{
    func navigationToMainVC(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: false)
    }
}


