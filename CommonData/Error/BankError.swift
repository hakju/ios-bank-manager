//
//  BankError.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/05.
//

import Foundation

enum BankError: Error {
    case typeRandomElement
    case close
    case unknown
}

extension BankError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .typeRandomElement:
            return "타입을 가져오는데 실패했습니다.\n다시 시도해 주세요."
        case .close:
            return "은행을 폐점하는데 실패했습니다.\n다시 시도해 주세요."
        case .unknown:
            return "알 수 없는 오류가 발생했습니다.\n다시 시도해 주세요."
        }
    }
}
