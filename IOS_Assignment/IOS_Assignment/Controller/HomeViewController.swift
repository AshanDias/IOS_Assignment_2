//
//  HomeViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-03-01.
//

import UIKit
import Firebase
var currentIndex=0
var cartCount = -1


 var cartItems: [Cart] = [
   
]

let foodItem: [FoodItem] = [
FoodItem(foodImage: #imageLiteral(resourceName: "icons8-kitchen-room-96.png"), foodName: "Burger 1", foodDescription: "Burger 1 Description", foodPrice: 150),
FoodItem(foodImage: #imageLiteral(resourceName: "pin2x-1.png"),foodName: "Burger 2", foodDescription: "Burger 2 Description", foodPrice: 250),
FoodItem(foodImage: #imageLiteral(resourceName: "pin2x-1.png"), foodName: "Burger 3", foodDescription: "Burger 3 Description", foodPrice: 350),
FoodItem(foodImage: #imageLiteral(resourceName: "pin2x-1.png"),foodName: "Burger 2", foodDescription: "Burger 2 Description", foodPrice: 250),   FoodItem(foodImage: #imageLiteral(resourceName: "pin2x-1.png"),foodName: "Burger 2", foodDescription: "Burger 2 Description", foodPrice: 250),   FoodItem(foodImage: #imageLiteral(resourceName: "pin2x-1.png"),foodName: "Burger 2", foodDescription: "Burger 2 Description", foodPrice: 250),   FoodItem(foodImage: #imageLiteral(resourceName: "pin2x-1.png"),foodName: "Burger 2", foodDescription: "Burger 2 Description", foodPrice: 250),   FoodItem(foodImage: #imageLiteral(resourceName: "pin2x-1.png"),foodName: "Burger 2", foodDescription: "Burger 2 Description", foodPrice: 250),   FoodItem(foodImage: #imageLiteral(resourceName: "pin2x-1.png"),foodName: "Burger 2", foodDescription: "Burger 2 Description", foodPrice: 250)

]


class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    private let database = Database.database().reference()

  

    @IBOutlet var tbl_cart:UITableView!
    @IBOutlet var tbl_foods:UITableView!
    
    @IBOutlet weak var btn_order: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton()
        
        let nib=UINib(nibName: "CartTableViewCell", bundle: nil)
        tbl_cart.register(nib, forCellReuseIdentifier: "CartTableViewCell")
            
        tbl_cart.delegate=self
        tbl_cart.dataSource=self
        
        let foodnib=UINib(nibName: "FoodsTableViewCell", bundle: nil)
        tbl_foods.register(foodnib, forCellReuseIdentifier: "FoodsTableViewCell")
        
        tbl_foods.delegate=self
        tbl_foods.dataSource=self
       
        DispatchQueue.main.async {
            
           
            self.LoadCart()
            
            self.displayTableView()
        }
        
      
        
       
    
       
        // Do any additional setup after loading the view.
    }
    
    func LoadCart(){
        
        
        self.database.child("Cart").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                
                let dataChange = snapshot.value as! [String:AnyObject]
              
                
              
                
                dataChange.forEach({ (key,val) in
                   
                    let cart = Cart(item: val["item"] as! String, price: val["price"] as! String, unit: val["unit"] as! Int, id: val["id"] as! String? )
                    
                
                    cartItems.append(cart)
                    
                })
              
               // print("Got data",snapshot.value!)
            }
            else {
               
                cartCount = 0
                
            }
            
           
            
        }
       
    }
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbl_cart{
            return cartItems.count
        }else if(tableView == tbl_foods){
            return foodItem.count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if tableView == tbl_cart {
          
            let cell=tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
         
            cell.setupView(cart: cartItems[indexPath.row])
         
            return cell
        } else {
            let cell=tableView.dequeueReusableCell(withIdentifier: "FoodsTableViewCell", for: indexPath) as! FoodsTableViewCell
           
            cell.setupView(food: foodItem[indexPath.row])
           
            return cell
        }
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tbl_foods {
            currentIndex=indexPath.row
            performSegue(withIdentifier: "foodNavogator", sender: self)
        }
       
    }
    
    func styleButton()  {
        btn_order.layer.cornerRadius=17
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        displayTableView()
       
    }
    
    func displayNoDataTagOnCart(){
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
               messageLabel.text = "No Records Found !"
               messageLabel.textColor = .black
               messageLabel.numberOfLines = 0
               messageLabel.textAlignment = .center
               messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
               messageLabel.sizeToFit()
        tbl_cart.backgroundView = messageLabel
        
    }
    
    func displayNoDataTagOnFood(){
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
               messageLabel.text = "No Records Found !"
               messageLabel.textColor = .black
               messageLabel.numberOfLines = 0
               messageLabel.textAlignment = .center
               messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
               messageLabel.sizeToFit()
       
        tbl_foods.backgroundView=messageLabel
       
    }
    func displayTableView(){
      
        
        if cartItems.count > 0  {
            tbl_cart.reloadData()
            tbl_cart.backgroundView=nil
            btn_order.isHidden=false
        }else{
            displayNoDataTagOnCart()
            btn_order.isHidden=true
        }
        if foodItem.count > 0 {
            tbl_foods.backgroundColor=nil
        }else{
            displayNoDataTagOnFood()
        }
       
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
   
    @IBAction func btnOrder(_ sender: Any) {
       
        performSegue(withIdentifier: "orderNav", sender: self)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        while(true){
            
            if cartItems.count > 0 || cartCount == 0{
            
                tbl_cart.reloadData()
                tbl_cart.backgroundView=nil
                btn_order.isHidden=false
                if cartItems.count == 0 {
                    displayNoDataTagOnCart()
                    btn_order.isHidden=true
                }
              
                break
            }
            
        }
        
       
    }
    
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        if tableView == tbl_cart{
//
//
//        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
//
//               let items = UILabel()
//                    items.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
//                    items.text = "Food Items"
//                    items.font = .systemFont(ofSize: 15)
//                    items.textColor = .black
//
//                let price = UILabel()
//                    price.frame = CGRect.init(x: 250, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
//                    price.text = "Price"
//                    price.font = .systemFont(ofSize: 15)
//                    price.textColor = .black
//
//               headerView.addSubview(items)
//                headerView.addSubview(price)
//
//            return headerView
//        }
//        else{
//            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 0))
//            return headerView
//        }
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
