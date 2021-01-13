//
//  StackWithButtons.swift
//  BankManagerUIApp
//
//  Created by Wonhee on 2021/01/14.
//

import UIKit

class StackWithButtons: UIStackView {
    private let addButtonTitle = "고객 10명 추가"
    private let resetButtonTitle = "초기화"
    private var touchAddAction: ((_ sender: UIButton) -> ())?
    private var touchResetAction: ((_ sender: UIButton) -> ())?
    
    // MARK: - init func
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    init(touchAdd: @escaping ((_ sender: UIButton) -> Void), touchReset: @escaping ((_ sender: UIButton) -> Void)) {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        touchAddAction = touchAdd
        touchResetAction = touchReset
        setup()
    }
    
    // MARK: - set up UI
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .fillEqually
        self.axis = .horizontal
        
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle(addButtonTitle, for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.isUserInteractionEnabled = true
        addButton.addTarget(self, action: #selector(touchAdd(_:)), for: .touchUpInside)
        self.addArrangedSubview(addButton)
        
        let resetButton = UIButton()
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setTitle(resetButtonTitle, for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
        resetButton.isUserInteractionEnabled = true
        resetButton.addTarget(self, action: #selector(touchReset(_:)), for: .touchUpInside)
        self.addArrangedSubview(resetButton)
    }
    
    // MARK: - button target action
    @objc func touchAdd(_ sender: UIButton) {
        if let touchAction = self.touchAddAction {
            touchAction(sender)
        }
    }
    
    @objc func touchReset(_ sender: UIButton) {
        if let touchAction = self.touchResetAction {
            touchAction(sender)
        }
    }
}
