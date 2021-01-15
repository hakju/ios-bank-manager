//
//  InputError.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/15.
//

import Foundation

enum InputError: Error {
    case input
    case number
    case mismatchNumber
}

extension InputError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .input:
            return "입력을 받지 못했습니다.\n다시 시도해 주세요."
        case .number:
            return "숫자를 입력해주세요."
        case .mismatchNumber:
            return "알맞은 숫자를 입력해주세요."
        }
    }
}
