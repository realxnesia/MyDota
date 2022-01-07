//
//  AltButtonRolesTVCell.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import UIKit

class AltButtonRolesTVCell: UITableViewCell {

    @IBOutlet weak var buttonNameLabel: UILabel!
    
    static let identifier = "AltButtonRolesTVCell"
    static func nib() -> UINib{
        UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
