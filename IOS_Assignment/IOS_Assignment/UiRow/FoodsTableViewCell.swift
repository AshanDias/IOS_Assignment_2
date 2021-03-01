//
//  FoodsTableViewCell.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-03-01.
//

import UIKit

class FoodsTableViewCell: UITableViewCell {

    @IBOutlet var img_imaga:UIImageView!
    @IBOutlet var lbl_name:UILabel!
    @IBOutlet var lbl_desc:UILabel!
    @IBOutlet var lbl_price:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
