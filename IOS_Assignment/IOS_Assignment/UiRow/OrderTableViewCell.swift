//
//  OrderTableViewCell.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-03-03.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet var lblPrice :UILabel!
    @IBOutlet var lblCount :UILabel!
    @IBOutlet var lblItem :UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(cart : Cart) {
        lblPrice.text=cart.price
        lblItem.text=cart.item
        lblCount.text = String(cart.unit)
        lblPrice.font = .systemFont(ofSize: 12)
        lblItem.font = .systemFont(ofSize: 12)
    }
    
}
