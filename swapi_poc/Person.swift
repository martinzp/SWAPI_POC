//
//  Person.swift
//  swapi_poc
//
//  Created by MARTIN ZUNIGA on 4/5/16.
//  Copyright © 2016 hattrick. All rights reserved.
//

import Foundation

class Person : NSObject {
    
    var name: String?
    var height: String?
    var mass: String?
    
    convenience init(jsonObject: AnyObject) {
        self.init()
        
        let personJsonObject = jsonObject as? [String: AnyObject]
        
        self.name   = personJsonObject!["name"] as? String
        self.height = personJsonObject!["height"] as? String
        self.mass   = personJsonObject!["mass"] as? String
        
    }
    
}