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
    private lazy var customersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
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
        let titleView = UIView()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleView)
        titleView.backgroundColor = rowColor
        titleView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.text = rowTitle
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        
        contentView.addSubview(customersStackView)
        customersStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        customersStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        customersStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        customersStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    func addSubviewInScroll(_ view: UIView) {
        customersStackView.addArrangedSubview(view)
    }
}
