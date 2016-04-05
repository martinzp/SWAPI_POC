//
//  EntityDetailViewController.swift
//  swapi_poc
//
//  Created by MARTIN ZUNIGA on 4/5/16.
//  Copyright © 2016 hattrick. All rights reserved.
//

import Foundation
import UIKit

class EntityDetailViewController : UIViewController {
    
    var entityToDisplay: AnyObject? = nil
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var firstDetailLabel: UILabel!
    @IBOutlet var secondDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = entityToDisplay as? Person {
            configureLayoutWithPerson(person)
        } else if let planet = entityToDisplay as? Planet {
            configureLayoutWithPlanet(planet)
        } else if let spaceShip = entityToDisplay as? SpaceShip {
            configureLayoutWithSpaceShip(spaceShip)
        }
    }
    
    func configureLayoutWithPerson(person: Person) {
        title                  = "Person Details"

        nameLabel.text         = "Name: \(person.name!)"
        firstDetailLabel.text  = "Height: \(person.height!)"
        secondDetailLabel.text = "Mass: \(person.mass!)"
    }
    
    func configureLayoutWithPlanet(planet: Planet) {
        title                  = "Planet Details"
        
        nameLabel.text         = "Name: \(planet.name!)"
        firstDetailLabel.text  = "Diameter: \(planet.diameter!)"
        secondDetailLabel.text = "Population: \(planet.population!)"
    }
    
    func configureLayoutWithSpaceShip(spaceShip: SpaceShip) {
        title                  = "StarShip Details"
        
        nameLabel.text         = "Name: \(spaceShip.name!)"
        firstDetailLabel.text  = "Model: \(spaceShip.model!)"
        secondDetailLabel.text = "Manufacturer: \(spaceShip.manufacturer!)"
    }
    
}