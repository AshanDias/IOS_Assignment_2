//
//  FoodDetailViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-03-01.
//

import UIKit
import Firebase

var res = foodItem[currentIndex]
class FoodDetailViewController: UIViewController {
  
    
    private let database = Database.database().reference()
    
    @IBOutlet  var btn_addCart:UIButton!
    @IBOutlet var btn_back :UIButton!
    @IBOutlet var lbl_price:UILabel!
    @IBOutlet var lbl_name :UILabel!
    @IBOutlet var lbl_desc:UILabel!
    @IBOutlet var img_image:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        radiusBtn()
        
         res = foodItem[currentIndex]
        lbl_price.text=String(res.foodPrice)
        lbl_desc.text=res.foodDescription
        img_image.image=res.foodImage
        print(cartItems)
        // Do any additional setup after loading the view.
    }
    
    func radiusBtn() {
        btn_addCart.layer.cornerRadius=20
    }
    
    
    @IBAction func btnAddCartClick(_ sender: Any) {
       
       
        let child="Item\(Int.random(in: 1...100))"
        cartItems.append(Cart(item: res.foodName, price: String(res.foodPrice), unit: 0,id: child))
        let cart =  Cart(item: res.foodName, price: String(res.foodPrice), unit: 0,id: child)
        
        let cartArray=cart.getJSON()
        self.database.child("Cart").child(child).setValue(cartArray)
        dismiss(animated: true, completion: nil)
      
       
    }
    
    
    @IBAction func btn_back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
