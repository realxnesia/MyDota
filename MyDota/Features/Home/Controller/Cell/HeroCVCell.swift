//
//  HeroCVCell.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import UIKit

class HeroCVCell: UICollectionViewCell {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    private var models: [Codable] = []
    var tempFilter = [String]()
    
    static let identifier = "HeroCVCell"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
