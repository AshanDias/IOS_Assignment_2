//
//  DashboardViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//

import UIKit

class DashboardViewController: UIViewController {
    
    
    @IBOutlet weak var uiTable: UITableView!
    
    let items = [
    
        Cart(item: "Cake", detail: "100"),
        Cart(item: "Biscuit", detail: "200"),
        
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTable.register(UINib(nibName: XIBIdentifiers.XIB_FOOD, bundle: nil), forCellReuseIdentifier: XIBIdentifiers.XIB_FOOD_CELL)
        print("jelllow",items.count)
        // Do any additional setup after loading the view.
    }
}


    extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print("jelllow",items.count)
            return items.count
            
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = uiTable.dequeueReusableCell(withIdentifier: XIBIdentifiers.XIB_FOOD_CELL, for: indexPath) as! CartItemCell
               //cell.selectionStyle = .none
            cell.setupView(cart:  items[indexPath.row])
            print("jelllow",cell)
            return cell
        }
    }
    
  

    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


