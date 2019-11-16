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
    @IBOutlet weak var apartmentCostsLabel: UILabel!
    @IBOutlet weak var carCostsLabel: UILabel!
    @IBOutlet weak var houseCostsLabel: UILabel!
    @IBOutlet weak var yachtCostsLabel: UILabel!
    @IBOutlet weak var aircraftCostsLabel: UILabel!
    @IBOutlet weak var childrenCostsLabel: UILabel!
    @IBAction func cancelLastActionButton(_ sender: UIButton) {
    }
    @IBAction func payButton(_ sender: UIButton) {
        wallet += cashflow
        updateUI()
    }
    @IBAction func randomIncomeButton(_ sender: UIButton) {
    }
    @IBAction func unexpectedExpesesButton(_ sender: UIButton) {
    }
    @IBAction func buyBusinessButton(_ sender: UIButton) {
    }
    @IBAction func improveBusinessButton(_ sender: UIButton) {
    }
    @IBAction func investmentsButton(_ sender: UIButton) {
    }
    @IBAction func largePurchasesButton(_ sender: UIButton) {
    }
    @IBAction func marriageDivorceButton(_ sender: UIButton) {
    }
    @IBAction func childButton(_ sender: UIButton) {
    }
    @IBAction func firedButton(_ sender: UIButton) {
    }
    @IBAction func bankruptButton(_ sender: UIButton) {
    }
    
    
    
    
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
        cashflow = income - consumption
        updateUI()
    }
    
    func updateUI() {
        
        income = player.salary // + passive
        consumption = player.rentalCosts + player.foodCosts + player.clothesCosts + player.clothesCosts + player.travelCosts + player.phoneCosts
        
        incomeLabel.text = "Общий доход: \(income)$"
        consumptionLabel.text = "Общий расход: \(consumption)$"
        cashflowLabel.text = "Cashflow: \(cashflow)$"
        walletLabel.text = "На счету: \(wallet)$"
        //суммарная стоимость активов
        salaryLabel.text = "Зарплата: \(player.salary)$"
        rentalCostsLabel.text = "\(player.rentalCosts)$"
        foodCostsLabel.text = "\(player.foodCosts)$"
        clothesCostsLabel.text = "\(player.clothesCosts)$"
        travelCostsLabel.text = "\(player.travelCosts)$"
        phoneCostsLabel.text = "\(player.phoneCosts)$"
        childrenCostsLabel.text = "\(player.childrenCosts)$"
        apartmentCostsLabel.text = "\(player.apartmentCosts)$"
        carCostsLabel.text = "\(player.carCosts)$"
        houseCostsLabel.text = "\(player.houseCosts)$"
        yachtCostsLabel.text = "\(player.yachtCosts)$"
        aircraftCostsLabel.text = "\(player.aircraftCosts)$"
    }

    var player: Player {
        let name = "Bob"
        let gender = playerGender.male
        let profession = "Кладовщик"
        
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

