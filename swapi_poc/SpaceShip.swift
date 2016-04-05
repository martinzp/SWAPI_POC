//
//  SpaceShip.swift
//  swapi_poc
//
//  Created by MARTIN ZUNIGA on 4/5/16.
//  Copyright © 2016 hattrick. All rights reserved.
//

import Foundation

class SpaceShip : NSObject {
    
    var name: String?
    var model: String?
    var manufacturer: String?
    
    convenience init(jsonObject: AnyObject) {
        self.init()
        
        let spaceShipJsonObject = jsonObject as? [String: AnyObject]
        
        self.name         = spaceShipJsonObject!["name"] as? String
        self.model        = spaceShipJsonObject!["model"] as? String
        self.manufacturer = spaceShipJsonObject!["manufacturer"] as? String
        
    }
    
}