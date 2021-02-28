//
//  CartItemCell.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//

import UIKit
class CartItemCell : UITableViewCell{
    
   
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
//
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//
    func setupView(cart: Cart) {
        lblItem.text = cart.item
        lblDetails.text=cart.detail
        
    }
    
    
}
