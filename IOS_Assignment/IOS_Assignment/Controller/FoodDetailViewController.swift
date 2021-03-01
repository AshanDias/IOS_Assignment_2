//
//  FoodDetailViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-03-01.
//

import UIKit

class FoodDetailViewController: UIViewController {

    @IBOutlet  var btn_addCart:UIButton!
    @IBOutlet var lbl_price:UILabel!
    @IBOutlet var lbl_desc:UILabel!
    @IBOutlet var img_image:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        radiusBtn()
        let res = foodItem[currentIndex]
        lbl_price.text=String(res.foodPrice)
        lbl_desc.text=res.foodDescription
        img_image.image=res.foodImage
        
        // Do any additional setup after loading the view.
    }
    
    func radiusBtn() {
        btn_addCart.layer.cornerRadius=20
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
