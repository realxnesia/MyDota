//
//  HeroDetailViewController.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import UIKit

class HeroDetailViewController: UIViewController {

    //MARK: - Data Temp 
    var heroName: String?
    var heroImage: String = ""
    var heroRoles: [String] = []
    var baseAttackMin: Int = 0
    var baseAttackMax: Int = 0
    var baseArmor: Double?
    var moveSpeed: Int = 0
    var baseHealth: Int = 0
    var baseMana: Int = 0
    var atributeType: String?
    
    var currentIndexHero: Int = 0
    var heroes = [String]()
    private var models: [Codable] = []
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var suggestHeroImageView1: UIImageView!
    @IBOutlet weak var suggestHeroImageView2: UIImageView!
    @IBOutlet weak var suggestHeroImageView3: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var armorLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var manaLabel: UILabel!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        navigationController?.navigationBar.tintColor = .black

    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)
   }

   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       AppUtility.lockOrientation(.all)
   }
    
}

extension HeroDetailViewController{
    func configureView(){
        heroNameLabel.text = heroName
        if let urlImage = URL(string: APIConstant.BASE_URL + heroImage){
            heroImageView.load(url: urlImage)
        }
        roleLabel.text = heroRoles.joined(separator: ",")
        attackLabel.text = "\(baseAttackMin) - \(baseAttackMax)"
        armorLabel.text = String(format: "%.2f", baseArmor!)
        speedLabel.text = String(moveSpeed)
        hpLabel.text = String(baseHealth)
        manaLabel.text = String(baseMana)
        Label.text = atributeType
        
        //MARK: - Change Background Color
        switch atributeType{
        case "str":
            view.backgroundColor = UIColor.strength
        case "agi":
            view.backgroundColor = UIColor.agility
        case "int":
            view.backgroundColor = UIColor.inteligent
        default:
            view.backgroundColor = UIColor.purple
        }
        
    }
}
