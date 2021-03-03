//
//  Cart.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//

import  UIKit
import Foundation

struct Cart {
    var item : String?
    var price : String?
    var unit : Int
    
    func getJSON() -> NSMutableDictionary {
           let dict = NSMutableDictionary()
           dict.setValue(item, forKey: "item")
           dict.setValue(price, forKey: "price")
        dict.setValue(unit, forKey: "unit")
           return dict
       }
}


