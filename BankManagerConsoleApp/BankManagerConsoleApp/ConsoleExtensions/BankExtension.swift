//
//  BankExtension.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/15.
//

import Foundation

extension Bank {
    func open(startWaitingNumber: Int, endWaitingNumber: Int) throws {
        resetData()
        try addCustomers(startWaitingNumber: startWaitingNumber, endWaitingNumber: endWaitingNumber)
        try work()
    }
}
