//
//  StackWithButtons.swift
//  BankManagerUIApp
//
//  Created by Wonhee on 2021/01/14.
//

import UIKit

class StackWithButtons: UIStackView {
    enum ButtonText {
        static let add = "고객 10명 추가"
        static let reset = "초기화"
    }
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(ButtonText.add, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(ButtonText.reset, for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    // MARK: - init func
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    init() {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        setup()
    }
    
    // MARK: - set up UI
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .fillEqually
        self.axis = .horizontal
        self.addArrangedSubview(addButton)
        self.addArrangedSubview(resetButton)
    }
}
