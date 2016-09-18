//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Alexander on 9/13/16.
//  Copyright © 2016 Alexander. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleIcon: UIImageView!
    
    let tipPercentages = [0.18, 0.20, 0.25];
    var formatter: NSNumberFormatter!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter = NSNumberFormatter();
        formatter.numberStyle = .CurrencyStyle;
        formatter.locale = NSLocale.currentLocale();
        
        billField.placeholder = formatter.stringFromNumber(0);
        billField.text = "";
        
        peopleIcon.image = peopleIcon.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate);
        peopleIcon.tintColor = UIColor(colorLiteralRed: 162, green: 222, blue: 208, alpha: 1);
        calculateTip(nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        let defaults = NSUserDefaults.standardUserDefaults();
        tipControl.selectedSegmentIndex = tipPercentages.indexOf(defaults.doubleForKey("default_tip_percentage")) ?? 0;
        calculateTip(nil);
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        view.endEditing(true);
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
    @IBAction func calculateTip(sender: AnyObject?) {
        
        // Default Value (??) if nil
        let bill = Double(billField.text!) ?? 0;
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex];
        let total = bill + tip;
        
        tipLabel.text = formatter.stringFromNumber(tip);
        totalLabel.text = formatter.stringFromNumber(total);
    }
}

