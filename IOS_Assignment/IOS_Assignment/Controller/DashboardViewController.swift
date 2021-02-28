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

  

    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


