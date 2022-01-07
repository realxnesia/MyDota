//
//  ButtonRolesTVCell.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import UIKit


protocol MyTableViewCellDelegate: AnyObject{
    func roleButtonTapped(with title: String)
}

class ButtonRolesTVCell: UITableViewCell {
    
    weak var delegate: MyTableViewCellDelegate?
    private var title: String = ""
    
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

        // Configure the view for the selected state
    }
    @IBAction func roleButtonTapped(_ sender: UIButton) {
        delegate?.roleButtonTapped(with: title)
    }
}

extension ButtonRolesTVCell{
    public func configureData(with title: String){
        self.title = title
        self.roleButton.setTitle(title, for: .normal)
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


