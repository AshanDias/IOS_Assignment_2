//
//  HomeViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var uiTable: UITableView!
    
    let items = [
    
        Cart(item: "Cake", detail: "100"),
        Cart(item: "Biscuit", detail: "200"),
        Cart(item: "Cake", detail: "100"),
        Cart(item: "Biscuit", detail: "200"),   Cart(item: "Cake", detail: "100"),
        Cart(item: "Biscuit", detail: "200"),   Cart(item: "Cake", detail: "100"),
        Cart(item: "Biscuit", detail: "200"),   Cart(item: "Cake", detail: "100"),
        Cart(item: "Biscuit", detail: "200"),   Cart(item: "Cake", detail: "100"),
        Cart(item: "Biscuit", detail: "200"),   Cart(item: "Cake", detail: "100"),
        Cart(item: "Biscuit", detail: "200"),   Cart(item: "Cake", detail: "100"),
        Cart(item: "Biscuit", detail: "200"),   Cart(item: "Cake", detail: "100"),
        Cart(item: "Biscuit", detail: "200"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiTable.dataSource = self
           self.uiTable.delegate = self
        uiTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
      
    }
    


}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("jelllow",items.count)
        return items.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
           let object = items[indexPath.row]
                cell.textLabel?.text = object.item
        cell.textLabel?.text=object.detail
           return cell
    }
}
