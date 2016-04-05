//
//  ViewController.swift
//  swapi_poc
//
//  Created by MARTIN ZUNIGA on 4/5/16.
//  Copyright © 2016 hattrick. All rights reserved.
//

import UIKit
import SVProgressHUD

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UITabBarDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var tabBar: UITabBar!
    
    var peopleTabBarItem: UITabBarItem!
    var planetsTabBarItem: UITabBarItem!
    var spaceShipsTabBarItem: UITabBarItem!
    
    var people: [Person]        = []
    var planets: [Planet]       = []
    var spaceShips: [SpaceShip] = []
    
    var selectedEntity: AnyObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SWAPI POC"
        edgesForExtendedLayout = .None
        
        setupTabBar()
        
        // Configure Table View
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTabBar() {
        
        // Setup Tabbar
        peopleTabBarItem     = UITabBarItem(title: "People", image: UIImage(named: "PeopleTabBarIcon"), tag: 0)
        planetsTabBarItem    = UITabBarItem(title: "Planets", image: UIImage(named: "PlanetsTabBarIcon"), tag: 1)
        spaceShipsTabBarItem = UITabBarItem(title: "StarShips", image: UIImage(named: "SpaceShipsTabBarIcon"), tag: 2)

        tabBar.items         = [peopleTabBarItem, planetsTabBarItem, spaceShipsTabBarItem]
        tabBar.selectedItem  = peopleTabBarItem
        tabBar.delegate      = self
        populateTable()
    }
    
    // MARK: UITabbarDelegate
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        populateTable()
        print("Tab Selected")
    }
   
    // MARK: - Objects Fetching
    
    func populateTable() {
        SVProgressHUD.show()
        if tabBar.selectedItem == peopleTabBarItem {
            APIManager.sharedInstance.getPeople { (people, error) in
                SVProgressHUD.dismiss()
                if error == nil {
                    self.people = people
                    self.tableView.reloadData()
                } else {
                    Utils.presentAlertMessage("Error", message: error!.localizedDescription, cancelActionText: "Ok", presentingViewContoller: self)
                }
            }
        } else if tabBar.selectedItem == planetsTabBarItem {
            APIManager.sharedInstance.getPlanets { (planets, error) in
                SVProgressHUD.dismiss()
                if error == nil {
                    self.planets = planets
                    self.tableView.reloadData()
                } else {
                    Utils.presentAlertMessage("Error", message: error!.localizedDescription, cancelActionText: "Ok", presentingViewContoller: self)
                }
            }
        } else {
            APIManager.sharedInstance.getSpaceShips{ (spaceShips, error) in
                SVProgressHUD.dismiss()
                if error == nil {
                    self.spaceShips = spaceShips
                    self.tableView.reloadData()
                } else {
                    Utils.presentAlertMessage("Error", message: error!.localizedDescription, cancelActionText: "Ok", presentingViewContoller: self)
                }
            }
        }
    }

    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tabBar.selectedItem == peopleTabBarItem {
            return people.count
        } else if tabBar.selectedItem == planetsTabBarItem {
            return planets.count
        } else {
            return spaceShips.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier")
        if cell == nil {
            cell = UITableViewCell()
        }
        if tabBar.selectedItem == peopleTabBarItem {
            cell!.textLabel?.text = people[indexPath.row].name
        } else if tabBar.selectedItem == planetsTabBarItem {
            cell!.textLabel?.text = planets[indexPath.row].name
        } else {
            cell!.textLabel?.text = spaceShips[indexPath.row].name
        }
        
        cell?.selectionStyle = .None
        return cell!
    }
    
    // MARK: - UItableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tabBar.selectedItem == peopleTabBarItem {
            selectedEntity = people[indexPath.row]
        } else if tabBar.selectedItem == planetsTabBarItem {
            selectedEntity = planets[indexPath.row]
        } else {
            selectedEntity = spaceShips[indexPath.row]
        }
        
        performSegueWithIdentifier("GoToDisplayEntity", sender: self)
    }
    
    
    // MARK: - Prepare For Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailsVC = segue.destinationViewController as? EntityDetailViewController {
            detailsVC.entityToDisplay = selectedEntity
        }
    }
    
}

