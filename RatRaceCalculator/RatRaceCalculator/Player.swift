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

    static var samplePlayer: Player {
        let player = Player()
        player.name = "Bob"
        player.gender = PlayerGender.male
        player.profession = "Кладовщик"
        player.salary = 500
        player.setValue(100, for: .rent)//rentalCosts = 100
        player.setValue(150, for: .food)//foodCosts = 150
        player.setValue(20, for: .clothes)//clothesCosts = 20
        player.setValue(20, for: .travel)//travelCosts = 20
        player.setValue(10, for: .phone)//phoneCosts = 10

        return player
    }

    var allCosts: Int {
        return _costValues.values.reduce(0, +)
    }

    func getValueForCost(_ cost: Costs) -> Int {
        return _costValues[cost] ?? 0
    }

    func setValue(_ value: Int, for cost: Costs) {
        _costValues[cost] = value
    }
}
