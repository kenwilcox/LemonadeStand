//
//  Supplies.swift
//  LemonadeStand
//
//  Created by Kenneth Wilcox on 1/19/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation

struct Supplies {
  
  var money = 0
  var lemons = 0
  var iceCubes = 0
  
  init(money: Int, lemons:Int, iceCubes: Int) {
    self.money = money
    self.lemons = lemons
    self.iceCubes = iceCubes
  }
  
}