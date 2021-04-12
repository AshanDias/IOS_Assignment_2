//
//  Cart.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//

import  UIKit
import Foundation

struct Cart {
   
    var item : String!
    var price : String!
    var unit : Int
    var id : String!
    var status : Int!
    var userName:String!
    func getJSON() -> NSMutableDictionary {
           let dict = NSMutableDictionary()
           dict.setValue(item, forKey: "item")
           dict.setValue(price, forKey: "price")
            dict.setValue(unit, forKey: "unit")
            dict.setValue(id, forKey: "id")
            dict.setValue(status, forKey: "status")
            dict.setValue(userName, forKey: "userName")
           return dict
       }
//    mutating func initWithDict(aDict: [String: AnyObject]) {
//        self.item = aDict["item"] as! String
//        self.price = aDict["price"] as! String
//       }
   
}


