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
    var roles2 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableList.delegate = self
        tableList.dataSource = self
        collectionList.delegate = self
        collectionList.dataSource = self
        
        configureCell()
    }
    
    func configureCell(){
        tableList.register(ButtonRolesTVCell.nib(), forCellReuseIdentifier: ButtonRolesTVCell.identifier)
        collectionList.register(HeroCVCell.nib(), forCellWithReuseIdentifier: HeroCVCell.identifier)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fullDetailHero.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ButtonRolesTVCell.identifier, for: indexPath) as! ButtonRolesTVCell
        cell.configureData(with: fullDetailHero[indexPath.row])
        //cell.roleButton.setTitle(<#T##title: String?##String?#>, for: <#T##UIControl.State#>)
        //cell.roleButton.titleLabel = roleList[indexPath.row]
        
//        roles2.append(roleList[indexPath.row].role)
//        print(roles2)
//        for name in roles2{
//            cell.roleButton.setTitle(name, for: .normal)
//        }
        
        //cell.roleButton.setTitle(roles2, for: .normal)
        
//        let slice = ["Pusher", "Initiator", "Support", "Disabler", "Nuker", "Carry", "Core"]
//        let slicer = Array(Set(slice).intersection(roles2))
//        print(slicer)
//        for name in slicer{
//            cell.roleButton.setTitle(name, for: .normal)
//        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fullDetailHero.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let heroCell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCVCell.identifier, for: indexPath) as! HeroCVCell
        heroCell.configureData(with: fullDetailHero[indexPath.row])
        return heroCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = HeroDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //HeroDetailVewController
}


