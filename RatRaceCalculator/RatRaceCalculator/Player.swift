//
//  StructPlayer.swift
//  RatRaceCalculator
//
//  Created by Admin on 14.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import Foundation

enum playerGender: String {
    case male
    case female
}


class Player {
    var name: String = ""
    var gender: playerGender = playerGender.male
    var profession: String = ""
    
    var salary: Int = 0
    var rentalCosts: Int = 0
    var foodCosts: Int = 0
    var clothesCosts: Int = 0
    var travelCosts: Int = 0
    var phoneCosts: Int = 0
    
    var kids: Int = 0
    
    var apartmentCosts: Int = 0
    var carCosts: Int = 0
    var houseCosts: Int = 0
    var yachtCosts: Int = 0
    var aircraftCosts: Int = 0
    
    var isMarried: Bool = false
//    let Costs = []
    
    
//    init(name: String, gender: playerGender, profession: String) {
//        self.name = name
//        self.gender = gender
//        self.profession = profession
//    }
}

