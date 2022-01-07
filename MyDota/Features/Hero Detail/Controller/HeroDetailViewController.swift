//
//  HeroDetailViewController.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import UIKit

class HeroDetailViewController: UIViewController {

    //MARK: - Data Temp
    var nameTemp: String?
    var roleTemp: String?
    var attackTemp: String?
    var defendTemp: String?
    var speedTemp: String?
    var hpTemp: String?
    var regenTemp: String?
    var typeTemp: String?
    
    @IBOutlet weak var heroImageView: UIImageView!
    
    @IBOutlet weak var suggestHeroImageView1: UIImageView!
    @IBOutlet weak var suggestHeroImageView2: UIImageView!
    @IBOutlet weak var suggestHeroImageView3: UIImageView!
    
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroRole: UILabel!
    
    
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defendLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var regenlabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    private func configureView(){
        self.heroNameLabel.text = nameTemp
        self.heroRole.text = roleTemp
        
        self.attackLabel.text = attackTemp
        self.defendLabel.text = defendTemp
        self.speedLabel.text = speedTemp
        self.hpLabel.text = hpTemp
        self.regenlabel.text = regenTemp
        self.speedLabel.text = speedTemp
        self.typeLabel.text = typeTemp
    }



}
