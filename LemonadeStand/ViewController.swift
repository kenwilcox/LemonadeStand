//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Kenneth Wilcox on 1/11/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var balanceLabel: UILabel!
  @IBOutlet weak var lemonTotalLabel: UILabel!
  @IBOutlet weak var iceCubeTotalLabel: UILabel!
  @IBOutlet weak var lemonPurchaseLabel: UILabel!
  @IBOutlet weak var iceCubePurchaseLabel: UILabel!
  @IBOutlet weak var lemonMixLabel: UILabel!
  @IBOutlet weak var iceCubeMixLabel: UILabel!
  
  @IBOutlet weak var lemonPurchaseStepper: UIStepper!
  @IBOutlet weak var iceCubePurchaseStepper: UIStepper!
  @IBOutlet weak var lemonMixStepper: UIStepper!
  @IBOutlet weak var iceCubeMixStepper: UIStepper!
  
  var balance = 10
  let lemonPrice = 2
  let icePrice = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func checkBalance() {
    let lemons = Int(lemonPurchaseStepper.value)
    let ice = Int(iceCubePurchaseStepper.value)
    let lemonCost = (lemons * lemonPrice)
    let iceCost = (ice * icePrice)
    
    let ret = balance - (lemonCost + iceCost)
    println("getBalance = \(ret)")
    
    // 10 - (lemons * lemonPrice) = 6
    // 6 / lemonPrice = 3
    // 3 + lemons = 5
    
    if lemonCost > 0 {
      var temp = ret / lemonPrice
      temp = temp + lemons
      lemonPurchaseStepper.maximumValue = Double(temp)
    }
    if iceCost > 0 {
      var temp = ret / icePrice
      temp = temp + ice
      iceCubePurchaseStepper.maximumValue = Double(temp)
    }
  }
  
  @IBAction func lemonPurchaseValueChanged(sender: UIStepper) {
    let totalLemons = Int(lemonPurchaseStepper.value)
    lemonPurchaseLabel.text = totalLemons.description
    checkBalance()
  }
  
  @IBAction func iceCubePurchaseValueChanged(sender: UIStepper) {
    let totalIce = Int(iceCubePurchaseStepper.value)
    iceCubePurchaseLabel.text = totalIce.description
    checkBalance()
  }
  
  @IBAction func lemonMixValueChanged(sender: UIStepper) {
    let mixLemons = Int(lemonMixStepper.value)
    lemonMixLabel.text = mixLemons.description
  }
  
  @IBAction func iceCubeMixValueChange(sender: UIStepper) {
    let mixIce = Int(iceCubeMixStepper.value)
    iceCubeMixLabel.text = mixIce.description
  }
  
  func showAlertWithText (header : String = "Warning", message : String) {
    var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }
}

