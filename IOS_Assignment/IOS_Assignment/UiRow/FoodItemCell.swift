//
//  FoodItemCell.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//
import  UIKit




class FoodItemCell: UITableViewCell {
    
    @IBOutlet weak var imgFoodImage: UIImageView!
    @IBOutlet weak var lblMealName: UILabel!
    @IBOutlet weak var lblMealDescription: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var viewParent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewParent.clipsToBounds = true
        viewParent.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView(food: FoodItem) {
        imgFoodImage.image = food.foodImage
        lblMealName.text = food.foodName
        lblMealDescription.text = food.foodDescription
        lblDistance.text = "\(food.distance)"
        lblPrice.text = "LKR.\(food.foodPrice)"
    }
    
}
