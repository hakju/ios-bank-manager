//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private enum Code {
    static let open = 1
    static let close = 2
}
private enum Information {
    static let bankersNumber = 3
    static let customerStartRandomNumber = 10
    static let customerEndRandomNumber = 30
    static let startWaitingNumber = 1
}
private let startMessage = "1 : 은행 개점\n2 : 종료\n입력 : "
private var isTerminate = false
private var bank = Bank(bankersNumbers: Information.bankersNumber)

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
        print(startMessage, terminator: "")
        guard let inputText = readLine() else {
            showError(InputError.input)
            continue
        }
        guard let inputCode = Int(inputText) else {
            showError(InputError.number)
            continue
        }
        if inputCode == Code.close {
            isTerminate = true
            break
        }
        if inputCode == Code.open {
            do {
                let endWaitingNumber = Int.random(in: Information.customerStartRandomNumber...Information.customerEndRandomNumber)
                try bank.open(startWaitingNumber: Information.startWaitingNumber, endWaitingNumber: Information.startWaitingNumber + endWaitingNumber)
            } catch {
                showError(error)
            }
        }
    }
}

startManage()
