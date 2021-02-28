//
//  CartTableViewCell.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-03-01.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var price:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
