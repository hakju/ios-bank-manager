//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// MARK: - dummy
private var isTerminate = false
private var bank = Bank(bankersNumbers: ConsoleBankManager.Information.bankersNumber)

// MARK: - show error
private func showError(_ error: Error) {
    let errorMessage: String
    
    if let inputError = error as? InputError {
        errorMessage = inputError.localizedDescription
    } else if let bankError = error as? BankError {
        errorMessage = bankError.localizedDescription
    } else {
        errorMessage = BankError.unknown.localizedDescription
    }
    print(errorMessage)
}

private func startManage() {
    while !isTerminate {
        print(ConsoleBankManager.startMessage, terminator: "")
        guard let inputText = readLine() else {
            showError(InputError.input)
            continue
        }
        guard let inputCode = Int(inputText) else {
            showError(InputError.number)
            continue
        }
        if inputCode == ConsoleBankManager.Code.close {
            isTerminate = true
            break
        }
        if inputCode == ConsoleBankManager.Code.open {
            do {
                let randomCustomersNumber = Int.random(in: ConsoleBankManager.Information.customerStartRandomNumber...ConsoleBankManager.Information.customerEndRandomNumber)
                try bank.open(customersNumber: randomCustomersNumber)
            } catch {
                showError(error)
            }
        }
    }
}

startManage()
