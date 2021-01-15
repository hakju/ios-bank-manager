//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private enum Information {
        static let bankersNumber = 3
        static let addCustomersCount = 10
    }
    private var bank = Bank(bankersNumbers: Information.bankersNumber)
    
    // MARK: UI property
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "업무시간 - 00:00:000"
        return label
    }()
    private lazy var buttonStack: UIStackView = {
        let stackView = StackWithButtons(touchAdd: addAction, touchReset: resetAction)
        return stackView
    }()
    private lazy var judgeCustomersRow: BankRowView = {
        let view =  BankRowView(.judging)
        return view
    }()
    private lazy var workingCustomersRow: BankRowView = {
        let view = BankRowView(.working)
        return view
    }()
    private lazy var waitingCustomersRow: BankRowView = {
        let view = BankRowView(.waiting)
        return view
    }()
    
    // MARK: button closures
    private lazy var addAction: ((_ sender: UIButton) -> Void) = {_ in
        do {
            try self.bank.addCustomers(Information.addCustomersCount)
        } catch {
            // TODO: add okAction -> reset
            self.showError(error, okAction: nil)
        }
    }
    private let resetAction: ((_ sender: UIButton) -> Void) = {_ in
        print("reset")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
        setUpTimerLabel()
        setUpBankCustomersRow()
//        judgeCustomersRow.addSubviewInScroll(CustomerView(customer: try! Customer(waitingNumber: 2)))
    }
    
    // MARK: - set up UI
    private func setUpButtons() {
        self.view.addSubview(buttonStack)
        buttonStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setUpTimerLabel() {
        self.view.addSubview(timerLabel)
        timerLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        timerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
    }

    private func setUpBankCustomersRow() {
        let containerStack = UIStackView()
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerStack)
        containerStack.axis = .vertical
        containerStack.distribution = .fillEqually
        containerStack.topAnchor.constraint(equalTo: self.timerLabel.bottomAnchor).isActive = true
        containerStack.bottomAnchor.constraint(equalTo: self.buttonStack.topAnchor).isActive = true
        containerStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        containerStack.addArrangedSubview(judgeCustomersRow)
        containerStack.addArrangedSubview(workingCustomersRow)
        containerStack.addArrangedSubview(waitingCustomersRow)
    }
}

