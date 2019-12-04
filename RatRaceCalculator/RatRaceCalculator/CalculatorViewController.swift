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
// Запретить добавлять бизнес, инвестиции и покупки при минусовом счете
// При втором бизнесе - увольнение

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
    @IBOutlet weak var carStatusLabel: UILabel!
    @IBOutlet weak var appartmentStatusLabel: UILabel!
    @IBOutlet weak var houseStatusLabel: UILabel!
    @IBOutlet weak var yachtStatusLabel: UILabel!
    @IBOutlet weak var aircraftStatusLabel: UILabel!
    @IBOutlet weak var familyStatusLabel: UILabel!
    @IBOutlet weak var childrenStatusLabel: UILabel!
    @IBOutlet weak var countOfMovesLabel: UILabel!
    @IBOutlet weak var countOfLapsLabel: UILabel!
    @IBOutlet weak var totalBusinessPriceLabel: UILabel!
    @IBOutlet weak var totalPriceOfInvestmentsLabel: UILabel!
    @IBOutlet weak var totalSumOfCreditsLabel: UILabel!
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
    var totalCountOfBusiness: [Business] = []
    var funcOfEnterValueVC: String = ""
    var totalCountOfSalary: Int = 0
    var laps: Int = 0
    var totalBusinessPrice: Int {
        return totalCountOfBusiness.map({$0.price}).reduce(0, +)
    }

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadSamplePlayer()

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
    @IBAction func cancelLastActionButtonTapped(_ sender: UIButton) {
        //Сделать историю действий
        //Добавить кнопку "изменить данные вручную"
    }

    @IBAction func payButtonTapped(_ sender: UIButton) {
        player.wallet += player.cashflow
        totalCountOfSalary += 1
        updateUI()
    }

    @IBAction func randomIncomeButtonTapped(_ sender: UIButton) {
        funcOfEnterValueVC = "randomIncome"
        performSegue(withIdentifier: "EnterValue", sender: nil)
    }

    @IBAction func unexpectedExpesesButtonTapped(_ sender: UIButton) {
        funcOfEnterValueVC = "unexpectedExpeses"
        performSegue(withIdentifier: "EnterValue", sender: nil)
    }

    @IBAction func buyBusinessButtonTapped(_ sender: UIButton) {
        guard player.wallet > 299 else {
            showAlertMessage("Не хватает денег на покупку бизнеса")
            return
        }

        performSegue(withIdentifier: "AddBusiness", sender: nil)
    }

    @IBAction func improveBusinessButtonTapped(_ sender: UIButton) {
        guard totalCountOfBusiness.count > 0 else { return }
        guard totalCountOfBusiness.first?.type == BusinessType.small else { return }

        funcOfEnterValueVC = "improveBusiness"
        // сделать другой VC? с крутилкой, где будут перечислены варианты улучшений МБ
        performSegue(withIdentifier: "EnterValue", sender: nil)
    }

    @IBAction func investmentsButtonTapped(_ sender: UIButton) {
    }

    @IBAction func largePurchasesButtonTapped(_ sender: UIButton) {
    }

    @IBAction func marriageDivorceButtonTapped(_ sender: UIButton) {
        if player.isMarried == false {
            marriageDivorceButton.setTitle("Развод", for: .normal)
            if player.gender == PlayerGender.male {
                player.wallet -= 5000
            }
        } else {
            marriageDivorceButton.setTitle("Свадьба", for: .normal)
            if player.gender == PlayerGender.male {
                player.kids = 0
                if player.wallet > 0 {
                    player.wallet /= 2
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
        firedButton.isHidden = true
        updateUI()
    }

    @IBAction func bankruptButtonTapped(_ sender: UIButton) {
        totalCountOfBusiness.removeLast()
        tableView.reloadData()
        updateUI()
    }

    // MARK: - Other Functions
    func updateUI() {
        if player.gender == PlayerGender.male {
            if player.isMarried == true {
                player.setValue(player.kids * 300, for: Costs.kids)
            } else {
                player.setValue(0, for: Costs.kids)
            }
        } else if player.gender == PlayerGender.female {
           if player.isMarried == false {
            player.setValue(player.kids * 300, for: Costs.kids)
            }
        }

        laps = totalCountOfSalary / 4

        hideUnusableButtons()
        calculatePassiveIncome()
        player.totalIncome = player.salary + player.passiveIncome
        player.cashflow = player.totalIncome - player.allCosts

        professionPlayerLabel.text = "Профессия: \(player.profession)"
        incomeLabel.text = "\(player.totalIncome)$"
        consumptionLabel.text = "\(player.allCosts)$"
        cashflowLabel.text = "\(player.cashflow)$"
        walletLabel.text = "\(player.wallet)$"
        salaryLabel.text = "\(player.salary)$"
        passiveIncomeLabel.text = "\(player.passiveIncome)$"
        countOfLapsLabel.text = "\(laps)"
        totalBusinessPriceLabel.text = "\(totalBusinessPrice)$"

        for costLabel in costLabels {
            if let cost = Costs(rawValue: costLabel.tag) {
                costLabel.text = "\(player.getValueForCost(cost))$"
            } else {
                assertionFailure("Unable to find enum with tag = \(costLabel.tag)")
            }
        }
    }

    func calculatePassiveIncome() {
        player.passiveIncome = 0
        for business in totalCountOfBusiness {
            player.passiveIncome += business.income
        }
    }

    func hideUnusableButtons() {
        if totalCountOfBusiness.count == 0 ||
        totalCountOfBusiness.first?.type != BusinessType.small {
            improveBusinessButton.isHidden = true
        } else {
            improveBusinessButton.isHidden = false
        }

        if totalCountOfBusiness.count == 0 {
            bankruptButton.isHidden = true
        } else {
            bankruptButton.isHidden = false
        }

        if player.gender == PlayerGender.male {
            if player.isMarried == false {
                childButton.isHidden = true
            } else {
                childButton.isHidden = false
            }
        }
    }

    private func showAlertMessage(_ message: String) {
        let alert = UIAlertController(title: "Неверный ввод данных", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - PlayerLoad
    func loadSamplePlayer() {
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
        // 2 когда добавлю коррупционеров
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

    // MARK: - Navigation
    @IBAction func unwindFromAddBusiness(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindFromAddBusiness" else { return }
        guard let addBusinessViewController = segue.source as? AddBusinessViewController,
            let newBusiness = addBusinessViewController.business
            else { return }

        totalCountOfBusiness.append(newBusiness)
        tableView.reloadData()
        updateUI()
    }

    @IBAction func unwindFromEnterValue(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindFromEnterValue" else { return }
        guard let enterValueViewController = segue.source as? EnterValueViewController
        else { return }

        if funcOfEnterValueVC == "randomIncome" {
            player.wallet += enterValueViewController.enteredValue
        } else if funcOfEnterValueVC == "unexpectedExpeses" {
            player.wallet -= enterValueViewController.enteredValue
        } else if funcOfEnterValueVC == "improveBusiness" {
            guard totalCountOfBusiness.first?.type == BusinessType.small else { return }
            let numberToImprove = totalCountOfBusiness.last?.countOfImprovement
            if let index = totalCountOfBusiness.firstIndex(where: { $0.countOfImprovement == numberToImprove }) {
                totalCountOfBusiness[index].countOfImprovement += 1
                totalCountOfBusiness[index].income += enterValueViewController.enteredValue
                tableView.reloadData()
            }
        } else {
            return
        }

        updateUI()
    }

    // MARK: - END
}
