//
//  ButtonRolesTVCell.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import UIKit
//import XCTest


protocol MyTableViewCellDelegate: AnyObject{
    func roleButtonTapped(with title: String)
}

protocol NavigationDelegate{
    func navigationToMainVC(vc: UIViewController)
}

//protocol NavigationDelegateWTitle: AnyObject{
//    func navigationVC(with title: String, vc: UIViewController)
//}

class ButtonRolesTVCell: UITableViewCell {
    
    weak var delegate: MyTableViewCellDelegate?
    var navDelegate: NavigationDelegate?
    //var navTitleDelegate: NavigationDelegateWTitle?
    private var title: String = ""
    private var models: [Codable] = []
    var tempFilter = [String]()
    
    @IBOutlet weak var roleButton: UIButton!
    
    static let identifier = "ButtonRolesTVCell"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //fetchAllHeroes()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        URLSession.shared.request(url: APIConstant.BASE_URL, expecting: ModelDetailHero.self) { result in
            switch result{
            case .success(let item):
                self.models = item
                print(item)
                
                ////https://stackoverflow.com/questions/44609216/dictionaries-string-string-in-swift
                let filtered = item.filter{ $0.roles.contains(identifierRoles) }
                for hero in 0..<filtered.count{
                    self.tempFilter.insert(filtered[hero].localizedName, at: 0)
                }
                

                DispatchQueue.main.async {
                    let vc = ViewController()
                    vc.heroesFiltered = self.tempFilter
                    vc.homeTitle = self.title
                    self.navDelegate?.navigationToMainVC(vc: vc)

                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - Fetch All Heroes
    func fetchAllHeroes(){
        URLSession.shared.request(url: APIConstant.BASE_URL, expecting: ModelDetailHero.self) { result in
            switch result{
            case .success(let item):
                self.models = item
                for hero in 0..<item.count{
                    self.tempFilter.insert(item[hero].localizedName, at: 0)
                }
                print(item)

                DispatchQueue.main.async {
                    let vc = ViewController()
                    vc.heroesFiltered = self.tempFilter
                    vc.homeTitle = self.title
                    self.navDelegate?.navigationToMainVC(vc: vc)
                }
            case .failure(let error):
                print(error)
            }
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



