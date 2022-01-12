//
//  ButtonRolesTVCell.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import UIKit
import CoreData
//import XCTest


protocol titleLabelDelegate: AnyObject{
    func roleButtonTapped(with title: String)
}

protocol NavigationDelegate{
    func navigationToMainVC(vc: UIViewController)
}

class ButtonRolesTVCell: UITableViewCell {
    
    //MARK: Related to TableView
    weak var delegate: titleLabelDelegate?
    var navDelegate: NavigationDelegate?
    private var title: String = ""
    
    //MARK: - Related to API Request
    private var models: [Codable] = []
    var heroName = [String]()
    var heroImages = [String]()
    var role = [String]()
    var baseAttackMin = [Int]()
    var baseAttackMax = [Int]()
    var baseArmor = [Double]()
    var moveSpeed = [Int]()
    var baseHealth = [Int]()
    var baseMana = [Int]()
    var atribute = [String]()
    
    //MARK: - Related to CoreData
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    let database = DatabaseHandler()
    var dataHeroFiltered = [HeroesEntity]()
    var dataRoleFiltered = [RoleEntity]()

    
    @IBOutlet weak var roleButton: UIButton!
    
    static let identifier = "ButtonRolesTVCell"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func roleButtonTapped(_ sender: UIButton) {
        delegate?.roleButtonTapped(with: title)
        configureButton()        
    }
}


extension ButtonRolesTVCell{
    public func configureData(with title: String){
        self.title = title
        self.roleButton.setTitle(title, for: .normal)
    }
    
    public func configureButton(){
        switch roleButton.titleLabel?.text{
        case Role.carry.rawValue:
            fetchSelectedRole(with: .support)
        case Role.disabler.rawValue:
            fetchSelectedRole(with: .disabler)
        case Role.durable.rawValue:
            fetchSelectedRole(with: .durable)
        case Role.escape.rawValue:
            fetchSelectedRole(with: .escape)
        case Role.initiator.rawValue:
            fetchSelectedRole(with: .initiator)
        case Role.jungler.rawValue:
            fetchSelectedRole(with: .jungler)
        case Role.nuker.rawValue:
            fetchSelectedRole(with: .nuker)
        case Role.pusher.rawValue:
            fetchSelectedRole(with: .pusher)
        case Role.support.rawValue:
            fetchSelectedRole(with: .support)
        default:
            fetchAllHeroes()
        }
    }
    
    //MARK: - Fetch Hero Based on Role
    func fetchSelectedRole(with identifierRoles: Role){
        URLSession.shared.request(url: URL(string: APIConstant.BASE_URL + APIConstant.HERO_STATS_URL), expecting: ModelDetailHero.self) { result in
            switch result{
            case .success(let item):
                self.models = item
                print(item)
                
                ////https://stackoverflow.com/questions/44609216/dictionaries-string-string-in-swift
                let filtered = item.filter{ $0.roles.contains(identifierRoles) }
                for hero in 0..<filtered.count{
                    self.heroName.insert(filtered[hero].localizedName, at: 0)
                    self.heroImages.insert(filtered[hero].img, at: 0)
                    
                    for addRole in 0..<filtered[hero].roles.count{
                        self.role.insert(filtered[hero].roles[addRole].rawValue, at: 0)
                    }

                    self.baseAttackMin.insert(filtered[hero].baseAttackMin, at: 0)
                    self.baseAttackMax.insert(filtered[hero].baseAttackMax, at: 0)
                    self.baseArmor.insert(filtered[hero].baseArmor, at: 0)
                    self.moveSpeed.insert(filtered[hero].moveSpeed, at: 0)
                    
                    self.baseHealth.insert(filtered[hero].baseHealth, at: 0)
                    self.baseMana.insert(filtered[hero].baseMana, at: 0)
                    self.atribute.insert(filtered[hero].primaryAttr.rawValue, at: 0)
                }

                DispatchQueue.main.async { [self] in
                    let vc = ViewController()
                    vc.heroesFiltered = self.heroName
                    vc.navTitle = self.title
                    vc.tempHeroesImage = self.heroImages
                    vc.tempRole = self.role
                    
                    vc.tempBaseAttackMin = self.baseAttackMin
                    vc.tempBaseAttackMax = self.baseAttackMax
                    vc.tempBaseArmor = self.baseArmor
                    vc.tempMoveSpeed = self.moveSpeed
                    vc.tempBaseHealth = self.baseHealth
                    vc.tempBaseMana = self.baseMana
                    vc.tempAtribute = self.atribute
                    
                    self.navDelegate?.navigationToMainVC(vc: vc)

                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - Fetch All Heroes
    func fetchAllHeroes(){
        URLSession.shared.request(url: URL(string: APIConstant.BASE_URL + APIConstant.HERO_STATS_URL), expecting: ModelDetailHero.self) { result in
            switch result{
            case .success(let item):
                self.models = item
                for hero in 0..<item.count{
                    self.heroName.insert(item[hero].localizedName, at: 0)
                    self.heroImages.insert(item[hero].img, at: 0)
                    
                    for addRole in 0..<item[hero].roles.count{
                        self.role.insert(item[hero].roles[addRole].rawValue, at: 0)
                    }
                            
                    self.baseAttackMin.insert(item[hero].baseAttackMin, at: 0)
                    self.baseAttackMax.insert(item[hero].baseAttackMax, at: 0)
                    self.baseArmor.insert(item[hero].baseArmor, at: 0)
                    self.moveSpeed.insert(item[hero].moveSpeed, at: 0)
                    self.baseHealth.insert(item[hero].baseHealth, at: 0)
                    self.baseMana.insert(item[hero].baseMana, at: 0)
                    self.atribute.insert(item[hero].primaryAttr.rawValue, at: 0)
                }
                print(item)

                DispatchQueue.main.async {
                    let vc = ViewController()
                    vc.navTitle = self.title
                    vc.heroesFiltered = self.heroName
                    vc.tempHeroesImage = self.heroImages
                    vc.tempHeroesImage = self.heroImages
                    vc.tempRole = self.role
                    vc.tempBaseAttackMin = self.baseAttackMin
                    vc.tempBaseAttackMax = self.baseAttackMax
                    vc.tempBaseArmor = self.baseArmor
                    vc.tempMoveSpeed = self.moveSpeed
                    vc.tempBaseHealth = self.baseHealth
                    vc.tempBaseMana = self.baseMana
                    vc.tempAtribute = self.atribute
                    self.navDelegate?.navigationToMainVC(vc: vc)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    //MARK: Fetch from Core Data
    func fetchRole(with identifierRoles: String){
        do{
            let request: NSFetchRequest<HeroesEntity> = HeroesEntity.fetchRequest()
            //request2.predicate = NSPredicate(format: "roles CONTAINS %@", identifierRoles)
            request.predicate = NSPredicate(format: "ANY roles CONTAINS[c] %@", identifierRoles)

            dataHeroFiltered = try context.viewContext.fetch(request)
            print(dataHeroFiltered)
            print(dataHeroFiltered.count)
        }catch{
            print(error.localizedDescription)
        }

    }
}

extension RangeReplaceableCollection where Element: Equatable {
    @discardableResult
    mutating func appendIfNotContains(_ element: Element) -> (appended: Bool, memberAfterAppend: Element) {
        if let index = firstIndex(of: element) {
            return (false, self[index])
        } else {
            append(element)
            return (true, element)
        }
    }
}



