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

  var weatherArray: [[Int]] = [[-10, -9, -5, -7], [5, 8, 10, 9], [22, 25, 27, 23]]
  var weatherToday: [Int] = [0, 0, 0, 0]
  var weatherImageView: UIImageView = UIImageView(frame: CGRectMake(20, 50, 50, 50))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    view.addSubview(weatherImageView)
    simulateWeatherToday()
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
    if lemonsToMix > Int(lemonMixStepper.value) {
      if lemonsToMix > 0 {
        supplies.lemons += 1
        lemonsToMix -= 1
      }
    }
    else {
      if supplies.lemons > 0 {
        supplies.lemons -= 1
        lemonsToMix += 1
      } else {
        lemonMixStepper.value -= 1
        showAlertWithText(header: "Oops", message: "No more lemons in inventory")
      }
    }
    lemonsToMix = Int(lemonMixStepper.value)
    updateMainView()
  }
  
  @IBAction func iceCubeMixValueChange(sender: UIStepper) {
    if iceCubesToMix > Int(iceCubeMixStepper.value) {
      if iceCubesToMix > 0 {
        supplies.iceCubes += 1
        iceCubesToMix -= 1
      }
    }
    else {
      if supplies.iceCubes > 0 {
        supplies.iceCubes -= 1
        iceCubesToMix += 1
      } else {
        iceCubeMixStepper.value -= 1
        showAlertWithText(header: "Oops", message: "No more ice in inventory")
      }
    }
    
    iceCubesToMix = Int(iceCubeMixStepper.value)
    updateMainView()
  }
  
  @IBAction func startDayButtonPressed(sender: AnyObject) {
    let average = findAverage(weatherToday)
    
    let customers = Int(arc4random_uniform(UInt32(average)))
//    println("customers: \(customers)")
    
    let lemonadeRatio = Float(lemonsToMix) / Float(iceCubesToMix)
//    println("lemonade ratio: \(lemonadeRatio)")

    var paidCustomers = 0
    
    if !lemonadeRatio.isNaN {
      for x in 0...customers {
        
        let preference = Double(arc4random_uniform(UInt32(100))) / 100
        
        if preference < 0.4 && lemonadeRatio > 1 {
          supplies.money += 1
          paidCustomers += 1
//          println("Paid")
        }
        else if preference > 0.6 && lemonadeRatio < 1 {
          supplies.money += 1
          paidCustomers += 1
//          println("Paid")
        }
        else if preference <= 0.6 && preference >= 0.4 && lemonadeRatio == 1 {
          supplies.money += 1
          paidCustomers += 1
//          println("Paid")
        }
//        else {
//          println("no match, no revenue")
//        }
      }
    } else {
      showAlertWithText(header: "Mix Something", message: "You didn't mix anything, you'll need to do that first")
    }
    
    lemonsToPurchase = 0
    iceCubesToPurchase = 0
    lemonsToMix = 0
    iceCubesToMix = 0
    
    lemonPurchaseStepper.value = 0
    iceCubePurchaseStepper.value = 0
    lemonMixStepper.value = 0
    iceCubeMixStepper.value = 0
    
    simulateWeatherToday()
    updateMainView()
    showAlertWithText(header: "Today's status", message: "You had \(customers) customers and \(paidCustomers) purchased lemonade")
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
  
  func simulateWeatherToday() {
    let index = Int(arc4random_uniform((UInt32(weatherArray.count))))
    
    weatherToday = weatherArray[index]
    
    switch index {
    case 0: weatherImageView.image = UIImage(named: "Cold")
    case 1: weatherImageView.image = UIImage(named: "Mild")
    case 2: weatherImageView.image = UIImage(named: "Warm")
    default: weatherImageView.image = UIImage(named: "Warm")
    }
  }
  
  func findAverage(data:[Int]) -> Int {
    var sum = 0
    
    for x in data {
      sum += x
    }
    var average:Double = Double(sum) / Double(data.count)
    var rounded:Int = Int(ceil(average))
    
    return rounded
  }
}

