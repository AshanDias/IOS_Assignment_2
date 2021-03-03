//
//  OrderViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-03-03.
//

import UIKit

class OrderViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet var tbl_orderCart:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib=UINib(nibName: "OrderTableViewCell", bundle: nil)
        tbl_orderCart.register(nib, forCellReuseIdentifier: "OrderTableViewCell")
        
        tbl_orderCart.delegate=self
        tbl_orderCart.dataSource=self
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func btnBack(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
       print(cartItems)
        cell.setupView(cart: cartItems[indexPath.row])
       
        return cell
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
