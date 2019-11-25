//
//  ViewController.swift
//  RatRaceCalculator
//
//  Created by Admin on 11.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//
// MARK: - START
import UIKit

// MARK: - #TODO
// Добавить подсчет суммы доходов от бизнесов в пассивный доход и обновлять cashflow
// Убирать из кошелька стоимость бизнеса
// Запретить добавлять бизнес при минусовом счете
// Менять строку типа бизнеса в зависимости от типа

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
    @IBOutlet weak var carStatusLabel: UILabel!
    @IBOutlet weak var appartmentStatusLabel: UILabel!
    @IBOutlet weak var houseStatusLabel: UILabel!
    @IBOutlet weak var yachtStatusLabel: UILabel!
    @IBOutlet weak var aircraftStatusLabel: UILabel!
    @IBOutlet weak var familyStatusLabel: UILabel!
    @IBOutlet weak var childrenStatusLabel: UILabel!
    @IBOutlet var costLabels: [UILabel]!

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
    var player = Player()
    var totalIncome: Int = 0
    var passiveIncome: Int = 0
    var consumption: Int = 0
    var cashflow: Int = 0
    var wallet: Int = 0
    var childrenCosts: Int = 0

    var unexpectedExpeses: Int = 200
    var randomIncome: Int = 500

    var totalCountOfBusiness: [Business] = []

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        playerLoad()

        namePlayerLabel.text = "Имя: \(player.name)"
        marriageDivorceButton.setTitle("Свадьба", for: .normal)
        if player.gender == PlayerGender.male {
            genderPlayerLabel.text = "Пол: Мужской"
        } else {
            genderPlayerLabel.text = "Пол: Женский"
        }
        updateUI()
    }

    // MARK: - @IBAction Functions
    @IBAction func unwindFromAddBusiness(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindFromAddBusiness" else { return }
        guard let addBusinessViewController = segue.source as? AddBusinessViewController,
            let newBusiness = addBusinessViewController.business
            else { return }

        totalCountOfBusiness.append(newBusiness)
        tableView.reloadData()
        updateUI()
    }

    @IBAction func cancelLastActionButtonTapped(_ sender: UIButton) {
        //Сделать историю действий
        //Добавить кнопку "изменить данные вручную"
    }

    @IBAction func payButtonTapped(_ sender: UIButton) {
        wallet += cashflow
        updateUI()
    }

    @IBAction func randomIncomeButtonTapped(_ sender: UIButton) {

        wallet += randomIncome
        updateUI()
    }

    @IBAction func unexpectedExpesesButtonTapped(_ sender: UIButton) {

        wallet -= unexpectedExpeses
        updateUI()
    }

    @IBAction func buyBusinessButtonTapped(_ sender: UIButton) {
    }

    @IBAction func improveBusinessButtonTapped(_ sender: UIButton) {
        //перенести в таблицу?

        tableView.reloadData()
        updateUI()
    }

    @IBAction func investmentsButtonTapped(_ sender: UIButton) {
    }

    @IBAction func largePurchasesButtonTapped(_ sender: UIButton) {
    }

    @IBAction func marriageDivorceButtonTapped(_ sender: UIButton) {
        if player.isMarried == false {
            marriageDivorceButton.setTitle("Развод", for: .normal)
            if player.gender == PlayerGender.male {
                wallet -= 5000
            }
        } else {
            marriageDivorceButton.setTitle("Свадьба", for: .normal)
            if player.gender == PlayerGender.male {
                player.kids = 0
                if wallet > 0 {
                    wallet /= 2
                }
            }
        }
        player.isMarried.toggle()
        updateUI()
    }

    @IBAction func childButtonTapped(_ sender: UIButton) {
        if player.gender == PlayerGender.male {
            if player.isMarried == true {
                player.kids += 1
            }
        } else if player.gender == PlayerGender.female {
            player.kids += 1
        }
            updateUI()
    }

    @IBAction func firedButtonTapped(_ sender: UIButton) {
        player.salary = 0
        if totalCountOfBusiness.count > 0 {
            if player.gender == PlayerGender.male {
                player.profession = "Бизнесмен"
            } else {
                player.profession = "Бизнесвумен"
            }
        } else {
            if player.gender == PlayerGender.male {
                player.profession = "Безработный"
            } else {
                player.profession = "Безработная"
            }
        }
        updateUI()
    }

    @IBAction func bankruptButtonTapped(_ sender: UIButton) {
        totalCountOfBusiness.removeLast()
        //пересчет стоимости всех бизнесов и дохода
        tableView.reloadData()
        updateUI()
    }

    // MARK: - Other Functions
    func updateUI() {
        if player.gender == PlayerGender.male {
            if player.isMarried == true {
            childrenCosts = player.kids * 300
            } else {
                childrenCosts = 0
            }
        } else if player.gender == PlayerGender.female {
           if player.isMarried == false {
            childrenCosts = player.kids * 300
            }
        }
        totalIncome = player.salary + passiveIncome
//        consumption = player.rentalCosts + player.foodCosts +
//        player.clothesCosts + player.clothesCosts + player.travelCosts + player.phoneCosts +
//        childrenCosts + player.apartmentCosts + player.carCosts +
//            player.houseCosts + player.yachtCosts + player.aircraftCosts
        cashflow = totalIncome - consumption

        professionPlayerLabel.text = "Профессия: \(player.profession)"
        incomeLabel.text = "\(totalIncome)$"
        consumptionLabel.text = "\(consumption)$"
        cashflowLabel.text = "\(cashflow)$"
        walletLabel.text = "\(wallet)$"
        salaryLabel.text = "\(player.salary)$"
        passiveIncomeLabel.text = "\(passiveIncome)"
//        rentalCostsLabel.text = "\(player.rentalCosts)$"
//        foodCostsLabel.text = "\(player.foodCosts)$"
//        clothesCostsLabel.text = "\(player.clothesCosts)$"
//        travelCostsLabel.text = "\(player.travelCosts)$"
//        phoneCostsLabel.text = "\(player.phoneCosts)$"
//        childrenCostsLabel.text = "\(childrenCosts)$"
//        apartmentCostsLabel.text = "\(player.apartmentCosts)$"
//        carCostsLabel.text = "\(player.carCosts)$"
//        houseCostsLabel.text = "\(player.houseCosts)$"
//        yachtCostsLabel.text = "\(player.yachtCosts)$"
//        aircraftCostsLabel.text = "\(player.aircraftCosts)$"

        for costLabel in costLabels {
            if let cost = Costs(rawValue: costLabel.tag) {
                costLabel.text = "\(player.getValueForCost(cost))$"
            } else {
                assertionFailure("Unable to find enum with tag = \(costLabel.tag)")
            }
        }
    }

    // MARK: - PlayerLoad
    func playerLoad() {
        player.name = "Bob"
        player.gender = PlayerGender.male
        player.profession = "Кладовщик"
        player.salary = 500
        player.setValue(100, for: .rent)//rentalCosts = 100
        player.setValue(150, for: .food)//foodCosts = 150
        player.setValue(20, for: .clothes)//clothesCosts = 20
        player.setValue(20, for: .travel)//travelCosts = 20
        player.setValue(10, for: .phone)//phoneCosts = 10
    }

// MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalCountOfBusiness.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "businessCell", for: indexPath)
        guard let cell = dequeuedCell as? BusinessTableViewCell else {
            assertionFailure("Unable to dequeue cell: businessCell")
            return UITableViewCell()
        }
        let businessRecord = totalCountOfBusiness[indexPath.row]
        cell.update(with: businessRecord)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
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
    override func tableView(_ tableView: UITableView,
     commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class,
                insert it into the array, and add a new row to the table view
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

    // MARK: - Navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddBusiness" {
            let popup = segue.destination as? AddBusinessViewController
            
            
        }
    }
     */

    // MARK: - END
}
