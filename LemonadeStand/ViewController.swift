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
  
  var supplies = Supplies(money: 10, lemons: 1, iceCubes: 1)
  var price = Price()
  
  var lemonsToPurchase = 0
  var iceCubesToPurchase = 0
  var lemonsToMix = 0
  var iceCubesToMix = 0
  
  let outOfMoney = "You don't have enough money"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    updateMainView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func lemonPurchaseValueChanged(sender: UIStepper) {
    if lemonsToPurchase > Int(lemonPurchaseStepper.value) {
      supplies.money += price.lemon
      supplies.lemons -= 1
    }
    else {
      if supplies.money >= price.lemon {
        supplies.money -= price.lemon
        supplies.lemons += 1
      } else {
        // Do this "else" check after updateMainView?
        lemonPurchaseStepper.value -= 1
        //lemonPurchaseStepper.maximumValue = lemonPurchaseStepper.value
        showAlertWithText(message: outOfMoney)
      }
    }
    
    lemonsToPurchase = Int(lemonPurchaseStepper.value)
    updateMainView()
  }
  
  @IBAction func iceCubePurchaseValueChanged(sender: UIStepper) {
    if iceCubesToPurchase > Int(iceCubePurchaseStepper.value) {
      supplies.money += price.ice
      supplies.iceCubes -= 1
    }
    else {
      if supplies.money >= price.ice {
        supplies.money -= price.ice
        supplies.iceCubes += 1
      } else {
        iceCubePurchaseStepper.value -= 1
        //iceCubePurchaseStepper.maximumValue = iceCubePurchaseStepper.value
        showAlertWithText(message: outOfMoney)
      }
    }
    
    iceCubesToPurchase = Int(iceCubePurchaseStepper.value)
    updateMainView()
  }
  
  @IBAction func lemonMixValueChanged(sender: UIStepper) {
    lemonsToMix = Int(lemonMixStepper.value)
    updateMainView()
  }
  
  @IBAction func iceCubeMixValueChange(sender: UIStepper) {
    iceCubesToMix = Int(iceCubeMixStepper.value)
    updateMainView()
  }
  
  func updateMainView() {
    balanceLabel.text = "$\(supplies.money)"
    lemonTotalLabel.text = "\(supplies.lemons) Lemons"
    iceCubeTotalLabel.text = "\(supplies.iceCubes) Ice Cubes"
    
    lemonPurchaseLabel.text = "\(lemonsToPurchase)"
    iceCubePurchaseLabel.text = "\(iceCubesToPurchase)"
    
    lemonMixLabel.text = "\(lemonsToMix)"
    iceCubeMixLabel.text = "\(iceCubesToMix)"
  }
  
  func showAlertWithText (header : String = "Warning", message : String) {
    var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }
}

