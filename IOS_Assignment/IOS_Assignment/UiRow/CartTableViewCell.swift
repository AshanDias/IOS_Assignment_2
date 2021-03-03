//
//  CartTableViewCell.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-03-01.
//

import UIKit 

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet var lbl_item:UILabel!
    @IBOutlet var lbl_price:UILabel!
    @IBOutlet var lbl_count:UILabel!
    @IBOutlet var btn_add:UIButton!
    @IBOutlet var btn_sub:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(cart : Cart) {
        lbl_price.text=cart.price
        lbl_item.text=cart.item
        lbl_price.font = .systemFont(ofSize: 12)
        lbl_item.font = .systemFont(ofSize: 12)
    }
    
    @IBAction func removeItem(_ sender: Any) {
        var countSub:Int
        var price : Double
        countSub = Int(lbl_count.text!)!
        price = Double(lbl_price.text!)!
        print(price)
        if countSub >=  1 {
            
            price = price / Double(countSub)
            countSub -= 1
            lbl_count.text=String(countSub)
            lbl_price.text=String(price)
            
        }
        
    }
    @IBAction func addItem(_ sender: Any) {
        var count :Int
        var price : Double
        count = Int(lbl_count.text!)!
        price = Double(lbl_price.text!)!
        count += 1
        price = price * Double(count)
        lbl_count.text=String(count)
        lbl_price.text=String(price)
        
      
        
    }
}
