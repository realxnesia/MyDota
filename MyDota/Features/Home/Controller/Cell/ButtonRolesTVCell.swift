//
//  ButtonRolesTVCell.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import UIKit

class ButtonRolesTVCell: UITableViewCell {
    @IBOutlet weak var roleButton: UIButton!
    
    var roles = [String]()
    let slice = ["Pusher"]
    
    static let identifier = "ButtonRolesTVCell"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func roleButtonTapped(_ sender: UIButton) {
    }
}

extension ButtonRolesTVCell{
    public func configureData(with model: GeneralData){
        roles.append(model.role)
        if !(roles.contains(model.role)){
            roles.append(model.role)
        }
        
        for name in roles{
            roleButton.setTitle(name, for: .normal)
        }
        
        //MARK: - BUAT MODEL DATA YANG UDAH DI SARING DAN DIKELOMPOKAN
        

//        let slicer = Array(Set(slice).intersection(roles))
//        print(slicer)
//        for name in slicer{
//            roleButton.setTitle(name, for: .normal)
//        }
        
        
//        print("++++")
//        var array1 = ["ad", "bd", "cd", "dd", "ed"]
//        var array2 = ["ad", "cd", "dd", "fd"]
//        array2 = Array(Set(array2).intersection(array1))
//        print(array2)
        
    }
    
    public func configure(){
        
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


