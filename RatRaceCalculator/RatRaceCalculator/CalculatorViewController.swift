//
//  ViewController.swift
//  RatRaceCalculator
//
//  Created by Admin on 11.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//
// MARK: - START
import UIKit

class CalculatorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
// MARK: - @IBoutlet
    @IBOutlet weak var namePlayerLabel: UILabel!
    @IBOutlet weak var genderPlayerLabel: UILabel!
    @IBOutlet weak var professionPlayerLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var consumptionLabel: UILabel!
    @IBOutlet weak var cashflowLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var passiveIncomeLabel: UILabel!
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
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var randomIncomeButton: UIButton!
    @IBOutlet weak var unexpectedExpesesButton: UIButton!
    @IBOutlet weak var buyBusinessButton: UIButton!
    @IBOutlet weak var improveBusinessButton: UIButton!
    @IBOutlet weak var investmentsButton: UIButton!
    @IBOutlet weak var largePurchasesButton: UIButton!
    @IBOutlet weak var marriageDivorceButton: UIButton!
    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var firedButton: UIButton!
    @IBOutlet weak var bankruptButton: UIButton!
    
// MARK: - @IBAction
    @IBAction func cancelLastActionButtonTapped(_ sender: UIButton) {
    }
    @IBAction func payButtonTapped(_ sender: UIButton) {
        wallet += cashflow
        updateUI()
    }
    @IBAction func randomIncomeButtonTapped(_ sender: UIButton) {
    }
    @IBAction func unexpectedExpesesButtonTapped(_ sender: UIButton) {
    }
    @IBAction func buyBusinessButtonTapped(_ sender: UIButton) {
    }
    @IBAction func improveBusinessButtonTapped(_ sender: UIButton) {
    }
    @IBAction func investmentsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func largePurchasesButtonTapped(_ sender: UIButton) {
    }
    @IBAction func marriageDivorceButtonTapped(_ sender: UIButton) {
    }
    @IBAction func childButtonTapped(_ sender: UIButton) {
        if player.familyStatus == false {
            player.familyStatus = true
        } else {
            player.familyStatus = false
        }
        updateUI()
    }
    @IBAction func firedButtonTapped(_ sender: UIButton) {
    }
    @IBAction func bankruptButtonTapped(_ sender: UIButton) {
    }
    
    
    
// MARK: - Variables and Constants
    
    var income: Int = 0
    var passiveIncome: Int = 0
    var consumption: Int = 0
    var cashflow: Int = 0
    var wallet: Int = 0

    
// MARK: - viewDidLoad
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
    
// MARK: - Functions
    func updateUI() {
        
        income = player.salary // + passive
        consumption = player.rentalCosts + player.foodCosts + player.clothesCosts + player.clothesCosts + player.travelCosts + player.phoneCosts
        cashflow = income - consumption
        
        incomeLabel.text = "\(income)$"
        consumptionLabel.text = "\(consumption)$"
        cashflowLabel.text = "\(cashflow)$"
        walletLabel.text = "\(wallet)$"
        //суммарная стоимость активов
        salaryLabel.text = "\(player.salary)$"
        passiveIncomeLabel.text = "\(passiveIncome)"
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
        
        if player.familyStatus == false {
            marriageDivorceButton.setTitle("Свадьба", for: .normal)
        } else {
            marriageDivorceButton.setTitle("Развод", for: .normal)
        }
    }

// MARK: - Player
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
        
        var familyStatus = false
        
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
                      aircraftCosts: aircraftCosts,
                      familyStatus: familyStatus)
    }
    

     

    
// MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
// MARK: - END
}

