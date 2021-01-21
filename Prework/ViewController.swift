//
//  ViewController.swift
//  Prework
//
//  Created by Luis Frias on 1/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitLabel: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalEditBill: UILabel!
    @IBOutlet weak var sliderOn: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        sliderOn.isOn = false
        tipSlider.isHidden = true
        // Do any additional setup after loading the view.
    }
   

    @IBAction func sliderEngaged(_ sender: Any) {
        if(sliderOn.isOn == true)
        {
            tipSlider.isHidden = false
            tipControl.isHidden = true
        }
        else
        {
            tipSlider.isHidden = true
            tipControl.isHidden = false
            tipControl.selectedSegmentIndex = 0
            calculateTip((Any).self)
        }
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let split = Double(splitLabel.text!) ?? 0
        let splitUp: Double
        let tip: Double
        if(tipSlider.isHidden == true)
        {
            let tipPercentage = [0.15,0.18,0.20]
            tip = bill *
                tipPercentage[tipControl.selectedSegmentIndex]
            
            
        }
        else
        {
            tipSlider.minimumValue = 0.10
            tipSlider.maximumValue = 0.50
            let slidingDouble = Double(tipSlider.value)
            tip = bill * slidingDouble
            
        }
        if(split <= 0)
        {
            splitUp = 1
        }
        else
        {
            splitUp = split
            
        }
        let totalEditBills = (bill + tip)
        let total = totalEditBills/splitUp
        
        tipAmountLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
        totalEditBill.text = String(format: "$%.2f",totalEditBills)
        
    }
   

}

