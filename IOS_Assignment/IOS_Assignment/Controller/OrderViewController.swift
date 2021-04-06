//
//  OrderViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-03-03.
//

import UIKit
import Firebase
var count = -1
class OrderViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    private let database = Database.database().reference()
    
    
    var cartData: [Cart] = [
      
   ]

    
    @IBOutlet var tbl_orderCart:UITableView!
    @IBOutlet var lbl_total:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib=UINib(nibName: "OrderTableViewCell", bundle: nil)
        tbl_orderCart.register(nib, forCellReuseIdentifier: "OrderTableViewCell")
        
        tbl_orderCart.delegate=self
        tbl_orderCart.dataSource=self
      
       
        LoadCart()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkout(_ sender: Any) {
       
        
        let user=Auth.auth().currentUser?.uid ?? ""
        var a=0
        for var items in cartData {
            a+=1
         
            items.status = 1
            
            let cartArray=items.getJSON()
            print("aaa",cartArray)
            self.database.child("Orders").child(user).child(String(a)).setValue(cartArray)
        }
        
        self.database.child("Cart").removeValue()
        cartItems.removeAll()
        cartData.removeAll()
        self.performSegue(withIdentifier: "mainViewNav", sender: self)
       
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
                    
              
                    self.cartData.append(cart)
                    
                }) // print("Got data",snapshot.value!)
            } else {
                
                count = 0
                
            }
         
           
            
        }
       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        while(true){
            
            if cartData.count > 0 || count == 0{
            
                tbl_orderCart.reloadData()
                tbl_orderCart.backgroundView=nil
              
              
              
//                break
            }
            
//        }
        calculateTotalValue()
      

    }
    
    func calculateTotalValue(){
        var total=Double()
        let cart=cartData
        cart.forEach({ (val) in
            total += Double(val.price)!
            //print("reached last",val)
        
        })
        
        lbl_total.text=String(total)
    }
    
    @IBAction func btnBack(_ sender: Any)
    {
        cartItems=cartData
        dismiss(animated: true, completion: nil)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
      
       print("A")
        cell.setupView(cart: cartData[indexPath.row])
       

        return cell
    }
   

    @IBAction func btn_clearCart(_ sender: Any) {
        var refreshAlert = UIAlertController(title: "Clear Cart", message: "All data will be lost.", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
          print("Handle Ok logic here")
            //delete forebase items
            self.database.child("Cart").removeValue()
            isDelete=1
            self.performSegue(withIdentifier: "mainViewNav", sender: self)
          }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
          print("Handle Cancel Logic here")
          }))

        present(refreshAlert, animated: true, completion: nil)
     
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
