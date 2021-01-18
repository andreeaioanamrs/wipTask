//
//  AddLocationView.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 18/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import UIKit

class AddLocationView: UIView {
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Address"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let latTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Latitude"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let lngTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Longitude"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(addressTextField)
        stackView.addArrangedSubview(latTextField)
        stackView.addArrangedSubview(lngTextField)
        stackView.addArrangedSubview(addButton)
        stackView.addArrangedSubview(cancelButton)
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
