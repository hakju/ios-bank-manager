//
//  ViewControllerExtension.swift
//  BankManagerUIApp
//
//  Created by Wonhee on 2021/01/15.
//

import UIKit

extension ViewController {
    func showError(_ error: Error, okAction: ((UIAlertAction) -> Void)?) {
        var errorMessage: String
        if let bankError = error as? BankError {
            errorMessage = bankError.localizedDescription
        } else {
            errorMessage = BankError.unknown.localizedDescription
        }
        
        let errorAlert = UIAlertController(title: nil, message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        errorAlert.addAction(okAction)
        
        self.present(errorAlert, animated: true, completion: nil)
    }
}
