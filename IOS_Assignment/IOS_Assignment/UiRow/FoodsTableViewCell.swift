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
    
    func setupView(food:FoodItem) {
        imageView?.image=food.foodImage
        lbl_name.text=food.foodName
        lbl_desc.text=food.foodDescription
        lbl_price.text=NumberFormatter().string(from: NSNumber(value: food.foodPrice))
    }
    
}
