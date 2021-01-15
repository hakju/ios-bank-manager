//
//  CustomerGradeExtension.swift
//  BankManagerUIApp
//
//  Created by Wonhee on 2021/01/15.
//

import Foundation
import UIKit

extension Customer.Grade {
    var color: UIColor {
        switch self {
        case .VVIP:
            return .systemRed
        case .VIP:
            return .systemBlue
        case .normal:
            return .black
        }
    }
}
