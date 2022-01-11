//
//  SplashViewController.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 11/01/22.
//

import UIKit

class SplashViewController: BaseVC {
    private var apiService = APIService()
    let database = DatabaseHandler()
    var tempDataHeroesEntity = [HeroesEntity]()
    var temDataRolesEntity = [RoleEntity]()
    
    //private var model = ModelDetailHeroes()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataHero()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)
        
        //MARK: Fetch Database here
        let results = self.database.fetch(HeroesEntity.self)
        let results2 = self.database.fetch(RoleEntity.self)
        print(results.map { $0.name } )
        print(results2.map { $0.role } )
   }

   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       AppUtility.lockOrientation(.all)
   }

    private func loadDataHero(){
        //fetch data from server
        apiService.getDetailDataHero { (result) in
            print(result)
            switch result{
            case .success(let list):
                
                //MARK: Save to CoreData
                for data in 0..<list.count{
                    
                    guard let heroModelEntity = self.database.add(HeroesEntity.self) else {return}
                    guard let roleModelEntity = self.database.add(RoleEntity.self) else {return}
                    heroModelEntity.id = Int16(list[data].id)
                    heroModelEntity.name = list[data].name
                    heroModelEntity.localizedName = list[data].localizedName
                    heroModelEntity.primaryAttr = list[data].primaryAttr.rawValue
                    heroModelEntity.attackType = list[data].attackType.rawValue
                    heroModelEntity.img = list[data].img
                    heroModelEntity.icon = list[data].icon
                    heroModelEntity.baseHealth = Int32(list[data].baseHealth)
                    heroModelEntity.baseMana = Int32(list[data].baseMana)
                    heroModelEntity.baseArmor = Double(list[data].baseArmor)
                    heroModelEntity.baseAttackMin = Int32(list[data].baseAttackMin)
                    heroModelEntity.baseAttackMax = Int32(list[data].baseAttackMax)
                    heroModelEntity.baseStr = Int32(list[data].baseStr)
                    heroModelEntity.baseAgi = Int32(list[data].baseAgi)
                    heroModelEntity.baseInt = Int32(list[data].baseInt)
                    heroModelEntity.attackRate = Double(list[data].attackRate)
                    heroModelEntity.moveSpeed = Int32(list[data].moveSpeed)
                    
                    for dataRole in 0..<list[data].roles.count{
                        //Add role heroModelEntity
                        heroModelEntity.roles = list[data].roles[dataRole].rawValue
                        //Add role from heroModelEntity to roleModelEntity
                        heroModelEntity.addToRole(roleModelEntity)
                        self.temDataRolesEntity.append(roleModelEntity)
                    }
                    
                    self.tempDataHeroesEntity.append(heroModelEntity)
                    self.database.save()
                }
                print(self.tempDataHeroesEntity.count)
                let vc = ViewController()
                vc.dataHeroFromSplash = self.tempDataHeroesEntity
                vc.dataRoleFromSplash = self.temDataRolesEntity
                self.navigationController?.pushViewController(vc, animated: true)
                //CoreData.sharedInstance.saveDataOf(heroes: ModelDetailHeroes2)
       
            case .failure(let error):
                //show alert
                DispatchQueue.main.async {
                    //self.showAlert(title: "Could not connect", message: "a")
                    self.showAlertWith(title: "Could not connect", message: "Please check your internet connection \n or try again")
                }
                
                //something error with json or datamodel
                print(error)
            }
            
        }
    }
    
    //MARK: - Show Alert
    func showAlertWith(title: String, message: String, style: UIAlertController.Style = .alert){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

}
