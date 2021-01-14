//
//  CustomerView.swift
//  BankManagerUIApp
//
//  Created by Wonhee on 2021/01/14.
//

import UIKit

class CustomerView: UIView {
    private var customer: Customer? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    init(customer: Customer) {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        self.customer = customer
        setup()
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        // TODO: error handling
        guard let currentCustomer = customer else {
            return
        }
        
        let gradeLabel = UILabel()
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(gradeLabel)
        gradeLabel.text = currentCustomer.grade.description
        gradeLabel.textColor = currentCustomer.grade.color
        gradeLabel.textAlignment = .center
        gradeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        gradeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        let numberLabel = UILabel()
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(numberLabel)
        numberLabel.text = "\(currentCustomer.waitingNumber)"
        numberLabel.textColor = currentCustomer.grade.color
        numberLabel.textAlignment = .center
        numberLabel.bottomAnchor.constraint(equalTo: gradeLabel.topAnchor, constant: -5).isActive = true
        numberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        let taskLabel = UILabel()
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(taskLabel)
        taskLabel.text = currentCustomer.taskType.description
        taskLabel.textColor = currentCustomer.grade.color
        taskLabel.textAlignment = .center
        taskLabel.topAnchor.constraint(equalTo: gradeLabel.bottomAnchor, constant: 5).isActive = true
        taskLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
