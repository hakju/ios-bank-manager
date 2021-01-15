//
//  BankExtension.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/15.
//

import Foundation

extension Bank {
    func open(customersNumber: Int) throws {
        resetData()
        try addCustomers(customersNumber)
        try work()
    }
}
