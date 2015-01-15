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

  func checkBalance() {
    let lemons = Int(lemonPurchaseStepper.value)
    let ice = Int(iceCubeMixStepper.value)
    let ret = balance - ((lemons * lemonPrice) + (ice * icePrice))
    println("getBalance = \(ret)")
    
    lemonPurchaseStepper.maximumValue = Double(balance - (balance / icePrice) / lemonPrice)
    iceCubePurchaseStepper.maximumValue = Double(balance - (balance / lemonPrice) / icePrice)
  }
  
  @IBAction func lemonPurchaseValueChanged(sender: UIStepper) {
    var totalLemons = Int(lemonPurchaseStepper.value)
    lemonPurchaseLabel.text = totalLemons.description
    checkBalance()
  }
  
  @IBAction func iceCubePurchaseValueChanged(sender: UIStepper) {
    var totalIce = Int(iceCubePurchaseStepper.value)
    iceCubePurchaseLabel.text = totalIce.description
    checkBalance()
  }
  
  @IBAction func lemonMixValueChanged(sender: UIStepper) {
  }
  
  @IBAction func iceCubeMixValueChange(sender: UIStepper) {
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  /*
  override func viewDidLoad() {
  super.viewDidLoad()
  
  stepper.wraps = true
  stepper.autorepeat = true
  stepper.maximumValue = 10
  }

*/
}

