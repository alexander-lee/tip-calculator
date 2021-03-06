//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Alexander on 9/17/16.
//  Copyright © 2016 Alexander. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = NSUserDefaults.standardUserDefaults();
    let tipPercentages = [0.18, 0.2, 0.25];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultTip = defaults.doubleForKey("default_tip_percentage") ?? 0.18;
        tipControl.selectedSegmentIndex = tipPercentages.indexOf(defaultTip) ?? 0;
        
        defaults.setDouble(defaultTip, forKey: "default_tip_percentage");
        defaults.synchronize();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipPercentageChanged(sender: AnyObject) {
        let tip = tipPercentages[tipControl.selectedSegmentIndex];
        
        defaults.setDouble(tip, forKey: "default_tip_percentage");
        defaults.synchronize();
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
