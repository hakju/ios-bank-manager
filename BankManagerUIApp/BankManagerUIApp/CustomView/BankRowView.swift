//
//  BankRowView.swift
//  BankManagerUIApp
//
//  Created by Wonhee on 2021/01/14.
//

import UIKit

class BankRowView: UIView {
    private var rowTitle: String? = nil
    private var rowColor: UIColor? = nil
    private lazy var customersScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    init(rowTitle: String, rowColor: UIColor) {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        self.rowTitle = rowTitle
        self.rowColor = rowColor
        setup()
    }
    
    private func setup() {
        let containerStackView = UIStackView()
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerStackView)
        containerStackView.axis = .horizontal
        containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        let titleView = UIView()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.addArrangedSubview(titleView)
        titleView.backgroundColor = rowColor
        titleView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.text = rowTitle
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        
        containerStackView.addArrangedSubview(customersScrollView)
        
    }
    
    func addSubviewInScroll(_ view: UIView) {
        
    }
}
