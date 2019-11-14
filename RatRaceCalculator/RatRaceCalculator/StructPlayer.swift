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


struct Player {
    var name: String
    var gender: playerGender
    var profession: String
    
    var salary: Int
    var rentalCosts: Int
    var foodCosts: Int
    var clothesCosts: Int
    var travelCosts: Int
    var phoneCosts: Int
    
    var childrenCosts: Int
    
    var apartmentCosts: Int
    var carCosts: Int
    var houseCosts: Int
    var yachtCosts: Int
    var aircraftCosts: Int
    
//    let Costs = []
}

