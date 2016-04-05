//
//  Planet.swift
//  swapi_poc
//
//  Created by MARTIN ZUNIGA on 4/5/16.
//  Copyright © 2016 hattrick. All rights reserved.
//

import Foundation

class Planet : NSObject {
 
    var name: String?
    var diameter: String?
    var population: String?
    
    convenience init(jsonObject: AnyObject) {
        self.init()
        
        let planetJsonObject = jsonObject as? [String: AnyObject]
        
        self.name       = planetJsonObject!["name"] as? String
        self.diameter   = planetJsonObject!["diameter"] as? String
        self.population = planetJsonObject!["population"] as? String
        
    }
    
}
