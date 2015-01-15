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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func lemonPurchaseValueChanged(sender: UIStepper) {
  }
  @IBAction func iceCubePurchaseValueChanged(sender: UIStepper) {
  }
  @IBAction func lemonMixValueChanged(sender: UIStepper) {
  }
  @IBAction func iceCubeMixValueChange(sender: UIStepper) {
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

