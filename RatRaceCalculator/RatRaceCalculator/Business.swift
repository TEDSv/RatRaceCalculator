//
//  Business.swift
//  RatRaceCalculator
//
//  Created by Admin on 19.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import Foundation

enum BusinessType: Int, CaseIterable {
    case small = 0
    case medium = 1
    case large = 2

    var name: String {
        switch self {
        case .small:
            return "Малый"
        case .medium:
            return "Средний"
        case .large:
            return "Крупный"
        }
    }
}

struct Business {
    var type: BusinessType
    var price: Int
    var income: Int
}
