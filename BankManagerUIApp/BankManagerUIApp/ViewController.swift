//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let addAction: ((_ sender: UIButton) -> Void) = {_ in
        print("add")
    }
    private let resetAction: ((_ sender: UIButton) -> Void) = {_ in
        print("reset")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
    }
    
    // MARK: - set up UI
    private func setUpButtons() {
        let buttonStack = StackWithButtons(touchAdd: addAction, touchReset: resetAction)
        self.view.addSubview(buttonStack)
        buttonStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

