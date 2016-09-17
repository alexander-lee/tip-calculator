//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Alexander on 9/13/16.
//  Copyright © 2016 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let tipPercentages = [0.18, 0.20, 0.25];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults();
        tipControl.selectedSegmentIndex = tipPercentages.indexOf(defaults.doubleForKey("default_tip_percentage")) ?? 0;
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        // Default Value (??) if nil
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

