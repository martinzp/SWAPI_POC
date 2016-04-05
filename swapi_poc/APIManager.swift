//
//  APIManager.swift
//  swapi_poc
//
//  Created by MARTIN ZUNIGA on 4/5/16.
//  Copyright © 2016 hattrick. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    // Singleton Instance
    static let sharedInstance = APIManager()
    
    // MARK: - Public Methods
    
    func getPeople(completionHandler: ([Person], NSError?) -> ()) -> () {
        performGETRequest("http://swapi.co/api/people", params: [:]) { (result, error) in
            var people: [Person] = []
            if result != nil {
                if let peopleJsonArray = result!["results"] as? [AnyObject] {
                    if peopleJsonArray.count > 0 {
                        for elem in peopleJsonArray {
                            people.append(Person(jsonObject: elem))
                        }
                    }
                    completionHandler(people, nil)
                } else {
                    completionHandler(people, error)
                }
            } else {
                completionHandler(people, error)
            }
        }
    }
    
    func getPlanets(completionHandler: ([Planet], NSError?) -> ()) -> () {
        performGETRequest("http://swapi.co/api/planets", params: [:]) { (result, error) in
            var planets: [Planet] = []
            if result != nil {
                if let planetsJsonArray = result!["results"] as? [AnyObject] {
                    if planetsJsonArray.count > 0 {
                        for elem in planetsJsonArray {
                            planets.append(Planet(jsonObject: elem))
                        }
                    }
                    completionHandler(planets, nil)
                } else {
                    completionHandler(planets, error)
                }
            } else {
                completionHandler(planets, error)
            }
        }
    }
    
    func getSpaceShips(completionHandler: ([SpaceShip], NSError?) -> ()) -> () {
        performGETRequest("http://swapi.co/api/starships", params: [:]) { (result, error) in
            var spaceShips: [SpaceShip] = []
            if result != nil {
                if let spaceShipsJsonArray = result!["results"] as? [AnyObject] {
                    if spaceShipsJsonArray.count > 0 {
                        for elem in spaceShipsJsonArray {
                            spaceShips.append(SpaceShip(jsonObject: elem))
                        }
                    }
                    completionHandler(spaceShips, nil)
                } else {
                    completionHandler(spaceShips, error)
                }
            } else {
                completionHandler(spaceShips, error)
            }
        }
    }
    
    
    // MARK: - Internal Methods
    
    func performGETRequest(url: String, params: [String: AnyObject], completionHandler: (AnyObject?, NSError?) -> ()) -> () {
        Alamofire.request(.GET, url, parameters: params, encoding: .URL, headers: [:]).responseJSON { response in
            
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if response.result.error == nil {
                if let JSON = response.result.value {
                    print(JSON)
                    completionHandler(JSON, nil)
                } else {
                    completionHandler(nil, Utils.createBasicErrorMessage("Error casting objects from response"))
                }
            } else {
                completionHandler(nil, response.result.error)
            }
        }
    }
    
}