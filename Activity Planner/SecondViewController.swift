//
//  SecondViewController.swift
//  Activity Planner
//
//  Created by Shashikant Jagtap on 24/05/2016.
//  Copyright © 2016 Shashikant Jagtap. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var activity: UITextField!
    
    
    
    @IBAction func ButtonActivity(sender: AnyObject) {
        
        activities.append(activity.text!)
        
        activity.text = ""
        // cannot call value of non-function type 'UserDefaults' 
        UserDefaults.standard.set(activities, forKey: "activities")
        
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    //'touchesBegan(_:withEvent:)' has been renamed to 'touchesBegan(_:with:)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        activity.resignFirstResponder()
        return true
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

