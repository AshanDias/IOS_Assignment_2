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
    var tel:Int!
    var date:String!
    var longtude:Double!
    var latitude:Double!
    func getJSON() -> NSMutableDictionary {
           let dict = NSMutableDictionary()
        
           dict.setValue(item, forKey: "item")
           dict.setValue(price, forKey: "price")
            dict.setValue(unit, forKey: "unit")
            dict.setValue(id, forKey: "id")
            dict.setValue(status, forKey: "status")
            dict.setValue(userName, forKey: "userName")
            dict.setValue(tel, forKey: "tel")
            dict.setValue(date, forKey: "date")
            dict.setValue(longtude, forKey: "longtude")
            dict.setValue(latitude, forKey: "latitude")
           return dict
       }
//    mutating func initWithDict(aDict: [String: AnyObject]) {
//        self.item = aDict["item"] as! String
//        self.price = aDict["price"] as! String
//       }
   
}

struct locationData{
    var longtude:Double
    var latitude:Double
}


