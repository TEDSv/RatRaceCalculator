//
//  Business.swift
//  RatRaceCalculator
//
//  Created by Admin on 19.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import Foundation

enum businessType {
    case small
    case medium
    case large
}

struct Business {
    var type: businessType
    var price: Int
    var income: Int
}
