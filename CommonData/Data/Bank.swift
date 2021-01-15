//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

class Bank {
    private var customers: [Customer] = []
    private var bankers: [Banker] = []
    private var totalProcessedCustomersNumber = 0
    private let bankGroup: DispatchGroup = DispatchGroup()
    private let closeMessage = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
    private let customerQueue = DispatchQueue.init(label: "customer")
    var openTime: Date?
    
    // MARK: - init func
    init(bankersNumbers: Int) {
        for number in 1...bankersNumbers {
            bankers.append(Banker(number))
        }
        setUpNotification()
    }
    
    private func setUpNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(assignedCustomerToBanker(_:)), name: .finishBankerTask, object: nil)
    }
    
    @objc func assignedCustomerToBanker(_ notification: Notification) {
        guard let bankerIndex = notification.object as? Int else {
            return
        }
        customerQueue.async {
            if self.customers.isNotEmpty {
                self.totalProcessedCustomersNumber += 1
                self.bankers[bankerIndex - 1].startWork(customer: self.customers.removeFirst(), group: self.bankGroup)
            }
        }
    }
    
    func addCustomers(_ customerNumber: Int) throws {
        for number in 1...customerNumber {
            customers.append(try Customer(waitingNumber: number))
        }
        
        sortCustomers()
    }
    
    private func sortCustomers() {
        customers.sort(by: { (first, second) -> Bool in
            if first.grade == second.grade {
                return first.waitingNumber < second.waitingNumber
            }
            return first.grade.priority < second.grade.priority
        })
    }
    
    func resetData() {
        customers.removeAll()
        totalProcessedCustomersNumber = 0
    }
    
    func work() throws {
        for banker in self.bankers {
            if self.customers.isEmpty {
                break
            }
            totalProcessedCustomersNumber += 1
            banker.startWork(customer: self.customers.removeFirst(), group: self.bankGroup)
        }
        self.bankGroup.wait()
        try self.close()
    }
    
    private func close() throws {
        guard let openTime = self.openTime else {
            throw BankError.close
        }
        let closeTime = Date()
        let totalTime = TimeInterval(closeTime.timeIntervalSince(openTime))
        print(String(format: closeMessage, self.totalProcessedCustomersNumber, totalTime))
    }
    
}
