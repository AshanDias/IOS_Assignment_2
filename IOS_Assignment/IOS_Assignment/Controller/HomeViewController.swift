//
//  HomeViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-03-01.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
        
    let cartItems: [Cart] = [
        Cart(item: "Cake", price: "200"),
        Cart(item: "Bun", price: "500"),
        Cart(item: "Burger", price: "300"),
        Cart(item: "Cocacola", price: "150"),
        Cart(item: "Fruit", price: "600")
        
    ]


    @IBOutlet var tbl_cart:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib=UINib(nibName: "CartTableViewCell", bundle: nil)
        tbl_cart.register(nib, forCellReuseIdentifier: "CartTableViewCell")
        tbl_cart.delegate=self
        tbl_cart.dataSource=self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell

        cell.setupView(cart: cartItems[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

               let items = UILabel()
                    items.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
                    items.text = "Food Items"
                    items.font = .systemFont(ofSize: 15)
                    items.textColor = .black

                let price = UILabel()
                    price.frame = CGRect.init(x: 250, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
                    price.text = "Price"
                    price.font = .systemFont(ofSize: 15)
                    price.textColor = .black

               headerView.addSubview(items)
                headerView.addSubview(price)

        return headerView
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
