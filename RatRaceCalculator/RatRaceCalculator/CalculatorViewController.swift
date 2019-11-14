//
//  ViewController.swift
//  RatRaceCalculator
//
//  Created by Admin on 11.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var namePlayerLabel: UILabel!
    @IBOutlet weak var genderPlayerLabel: UILabel!
    @IBOutlet weak var professionPlayerLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var consumptionLabel: UILabel!
    @IBOutlet weak var cashflowLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var walletLabel: UILabel!
    @IBOutlet weak var rentalCostsLabel: UILabel!
    @IBOutlet weak var foodCostsLabel: UILabel!
    @IBOutlet weak var clothesCostsLabel: UILabel!
    @IBOutlet weak var travelCostsLabel: UILabel!
    @IBOutlet weak var phoneCostsLabel: UILabel!
    
    
    var income: Int = 0
    var consumption: Int = 0
    var cashflow: Int = 0
    var wallet: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namePlayerLabel.text = "Имя: \(player.name)"
        professionPlayerLabel.text = "Профессия: \(player.profession)"
        if player.gender == playerGender.male {
            genderPlayerLabel.text = "Пол: Мужской"
        } else {
            genderPlayerLabel.text = "Пол: Женский"
        }
        updateUI()
    }
    
    func updateUI() {
        
        income = player.salary
        consumption = player.rentalCosts + player.foodCosts + player.clothesCosts + player.clothesCosts + player.travelCosts + player.phoneCosts
        cashflow = income - consumption
        
        incomeLabel.text = "Общий доход: \(income)$"
        consumptionLabel.text = "Общий расход: \(consumption)$"
        cashflowLabel.text = "Cashflow: \(cashflow)$"
        walletLabel.text = "Баланс: \(wallet)$"
        salaryLabel.text = "Зарплата: \(player.salary)$"
        rentalCostsLabel.text = "Аренда жилья:  \(player.rentalCosts)$"
        foodCostsLabel.text = "Расходы на питание:\(player.foodCosts)$"
        clothesCostsLabel.text = "Расходы на одежду: \(player.clothesCosts)$"
        travelCostsLabel.text = "Расходы на проезд:  \(player.travelCosts)$"
        phoneCostsLabel.text = "Расходы на телефонные переговоры: \(player.phoneCosts)$"
    }

    var player: Player {
        let name = "Bob"
        let gender = playerGender.male
        let profession = "storekeeper"
        
        let salary = 500
        
        var rentalCosts = 100
        let foodCosts = 150
        let clothesCosts = 20
        var travelCosts = 20
        let phoneCosts = 10
        var childrenCosts = 0
        var apartmentCosts = 0
        var carCosts = 0
        var houseCosts = 0
        var yachtCosts = 0
        var aircraftCosts = 0
        
        return Player(name: name,
                      gender: gender,
                      profession: profession,
                      salary: salary,
                      rentalCosts: rentalCosts,
                      foodCosts: foodCosts,
                      clothesCosts: clothesCosts,
                      travelCosts: travelCosts,
                      phoneCosts: phoneCosts,
                      childrenCosts: childrenCosts,
                      apartmentCosts: apartmentCosts,
                      carCosts: carCosts,
                      houseCosts: houseCosts,
                      yachtCosts: yachtCosts,
                      aircraftCosts: aircraftCosts )
    }
    

    
    
}

