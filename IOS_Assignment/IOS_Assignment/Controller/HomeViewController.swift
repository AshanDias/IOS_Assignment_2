//
//  HomeViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
  

    @IBOutlet weak var uiTable: UITableView!
    
    let healthyFoods = [
            [
                "name":"Apple",
                "price":"100.00"
            ],
            [
                "name":"Orange",
                "price":"50.00"
            ],
            [
                "name":"Pear",
                "price":"60.00"
            ],
            [
                "name":"Grapefruit",
                "price":"100.00"
            ],
            [
                "name":"Potato",
                "price":"30.00"
            ],
            [
                "name":"Tomato",
                "price":"40.00"
            ]
            
        ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTable.register(CartTableViewCell.self, forCellReuseIdentifier: "CartTableViewCell")

        self.uiTable.dataSource = self
           self.uiTable.delegate = self
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return healthyFoods.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.textLabel?.text = healthyFoods[indexPath.row]["name"];
        cell.price.text = healthyFoods[indexPath.row]["price"];
        return cell
    }
    

   
}

