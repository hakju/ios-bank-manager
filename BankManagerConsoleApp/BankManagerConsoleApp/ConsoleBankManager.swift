//
//  ConsoleBankManager.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/15.
//

import Foundation

class ConsoleBankManager {
    static let startMessage = "1 : 은행 개점\n2 : 종료\n입력 : "
    
    enum Code {
        static let open = 1
        static let close = 2
    }
    
    enum Information {
        static let bankersNumber = 3
        static let customerStartRandomNumber = 10
        static let customerEndRandomNumber = 30
    }
}
