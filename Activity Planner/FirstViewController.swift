//
//  FirstViewController.swift
//  Activity Planner
//
//  Created by Shashikant Jagtap on 24/05/2016.
//  Copyright © 2016 Shashikant Jagtap. All rights reserved.
//

import UIKit


var activities = [String]()


class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var activityTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standardUserDefaults().objectForKey("activities") != nil {
        
        activities = UserDefaults.standardUserDefaults().objectForKey("activities") as! [String]!
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return activities.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = activities[indexPath.row]
        
        return cell
        
        
        
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            activities.remove(at: indexPath.row)
            
            UserDefaults.standardUserDefaults().setObject(activities, forKey: "activities")
            
            activityTable.reloadData()
            
            
        }
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
       activityTable.reloadData()
    }
    
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

