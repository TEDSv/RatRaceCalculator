//
//  StructPlayer.swift
//  RatRaceCalculator
//
//  Created by Admin on 14.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import Foundation

enum PlayerGender: String {
    case male
    case female
}

enum Costs: Int {
    case rent = 0
    case food = 1
    case clothes = 2
    case travel = 3
    case phone = 4
    case kids = 5
    case apartment = 6
    case car = 7
    case house = 8
    case yacht = 9
    case aircraft = 10
}

class Player {
    var name: String = ""
    var gender: PlayerGender = PlayerGender.male
    var profession: String = ""
    var salary: Int = 0
    var isMarried: Bool = false
    var kids: Int = 0

    var totalIncome: Int = 0
    var passiveIncome: Int = 0
    var consumption: Int = 0
    var cashflow: Int = 0
    var wallet: Int = 0

    private var _costValues: [Costs: Int] = [:]

    var allCosts: Int {
        return _costValues.values.reduce(0, +)
    }

    func getValueForCost(_ cost: Costs) -> Int {
        return _costValues[cost] ?? 0
    }

    func setValue(_ value: Int, for cost: Costs) {
        _costValues[cost] = value
    }

    //    var rentalCosts: Int = 0
    //    var foodCosts: Int = 0
    //    var clothesCosts: Int = 0
    //    var travelCosts: Int = 0
    //    var phoneCosts: Int = 0
    //    var apartmentCosts: Int = 0
    //    var carCosts: Int = 0
    //    var houseCosts: Int = 0
    //    var yachtCosts: Int = 0
    //    var aircraftCosts: Int = 0
}
