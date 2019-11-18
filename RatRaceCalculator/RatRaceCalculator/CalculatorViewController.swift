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
    // add labels: какой ход и какой круг, сколько вложено в инвестиции, стоимость бизнесов
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
    
    // MARK: - Variables and Constants
    var player = Player ()
    var totalIncome: Int = 0
    var passiveIncome: Int = 0
    var consumption: Int = 0
    var cashflow: Int = 0
    var wallet: Int = 0
    var childrenCosts: Int = 0
    var totalCountOfBusiness: Int = 0
    
    var businessCost: Int = 600
    var businessIncome: Int = 300
        
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        playerLoad()
        
        namePlayerLabel.text = "Имя: \(player.name)"
        marriageDivorceButton.setTitle("Свадьба", for: .normal)
        if player.gender == playerGender.male {
            genderPlayerLabel.text = "Пол: Мужской"
        } else {
            genderPlayerLabel.text = "Пол: Женский"
        }
        updateUI()
    }
        
// MARK: - @IBAction Functions
    @IBAction func cancelLastActionButtonTapped(_ sender: UIButton) {
        //Сделать историю действий
        //Добавить кнопку "изменить данные вручную"
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
        totalCountOfBusiness += 1
        
        updateUI()
    }
    
    @IBAction func improveBusinessButtonTapped(_ sender: UIButton) {
        //перенести в таблицу?
    }
    
    @IBAction func investmentsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func largePurchasesButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func marriageDivorceButtonTapped(_ sender: UIButton) {
        if player.isMarried == false {
            marriageDivorceButton.setTitle("Развод", for: .normal)
            if player.gender == playerGender.male {
                wallet = wallet - 5000
            }
        } else {
            marriageDivorceButton.setTitle("Свадьба", for: .normal)
            if player.gender == playerGender.male {
                player.kids = 0
                if wallet > 0 {
                    wallet = wallet / 2
                }
            }
        }
        player.isMarried.toggle()
        updateUI()
    }
    
    @IBAction func childButtonTapped(_ sender: UIButton) {
        if player.gender == playerGender.male {
            if player.isMarried == true {
                player.kids += 1
            }
        } else if player.gender == playerGender.female {
            player.kids += 1
        }
            updateUI()
    }
    
    @IBAction func firedButtonTapped(_ sender: UIButton) {
        player.salary = 0
        if totalCountOfBusiness > 0 {
            if player.gender == playerGender.male {
                player.profession = "Бизнесмен"
            } else {
                player.profession = "Бизнесвумен"
            }
        } else {
            if player.gender == playerGender.male {
                player.profession = "Безработный"
            } else {
                player.profession = "Безработная"
            }
        }
        updateUI()
    }
    
    @IBAction func bankruptButtonTapped(_ sender: UIButton) {
        totalCountOfBusiness -= 1
        //пересчет стоимости всех бизнесов и дохода
        updateUI()
    }

// MARK: - Other Functions
    func updateUI() {
        if player.gender == playerGender.male {
            if player.isMarried == true {
            childrenCosts = player.kids * 300
            } else {
                childrenCosts = 0
            }
        } else if player.gender == playerGender.female {
           if player.isMarried == false {
            childrenCosts = player.kids * 300
            }
        }
        totalIncome = player.salary + passiveIncome
        consumption = player.rentalCosts + player.foodCosts + player.clothesCosts + player.clothesCosts + player.travelCosts + player.phoneCosts + childrenCosts + player.apartmentCosts + player.carCosts + player.houseCosts + player.yachtCosts + player.aircraftCosts
        cashflow = totalIncome - consumption
        
        professionPlayerLabel.text = "Профессия: \(player.profession)"
        incomeLabel.text = "\(totalIncome)$"
        consumptionLabel.text = "\(consumption)$"
        cashflowLabel.text = "\(cashflow)$"
        walletLabel.text = "\(wallet)$"
        salaryLabel.text = "\(player.salary)$"
        passiveIncomeLabel.text = "\(passiveIncome)"
        rentalCostsLabel.text = "\(player.rentalCosts)$"
        foodCostsLabel.text = "\(player.foodCosts)$"
        clothesCostsLabel.text = "\(player.clothesCosts)$"
        travelCostsLabel.text = "\(player.travelCosts)$"
        phoneCostsLabel.text = "\(player.phoneCosts)$"
        childrenCostsLabel.text = "\(childrenCosts)$"
        apartmentCostsLabel.text = "\(player.apartmentCosts)$"
        carCostsLabel.text = "\(player.carCosts)$"
        houseCostsLabel.text = "\(player.houseCosts)$"
        yachtCostsLabel.text = "\(player.yachtCosts)$"
        aircraftCostsLabel.text = "\(player.aircraftCosts)$"
    }
    
    // MARK: - PlayerLoad
    func playerLoad() {
        player.name = "Bob"
        player.gender = playerGender.male
        player.profession = "Кладовщик"
        player.salary = 500
        player.rentalCosts = 100
        player.foodCosts = 150
        player.clothesCosts = 20
        player.travelCosts = 20
        player.phoneCosts = 10
    }
    
// MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return totalCountOfBusiness
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "businessCell", for: indexPath)

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

