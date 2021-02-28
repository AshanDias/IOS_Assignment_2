//
//  CartItemCell.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//

import UIKit
class CartItemCell : UITableViewCell{
    
   
   //@IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var label1: UILabel!
   // @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupView(cart: Cart) {
        //  lblItem.text = "aaaaa"
       // lblDetails.text=nil
        label1.text=cart.detail
        label2.text=cart.item
    }
    
    
}
