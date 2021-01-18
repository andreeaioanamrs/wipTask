//
//  LocationDetailsViewController.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 18/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import UIKit
import RxSwift

class LocationDetailsViewController: UIViewController, BindableType {
    
    var viewModel: LocationDetailsViewModel!
    private let disposeBag = DisposeBag()
    
    private let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let latLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let longLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 200, trailing: 16)
        return stackView
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("EDIT", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    private let editLocationView = AddEditLocationView(scenario: .edit)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        edgesForExtendedLayout = []

        setupSubviews()
        setupConstraints()
    }
    
    func bindViewModel() {
        viewModel.location
            .bind(onNext: configure(with:))
            .disposed(by: disposeBag)
        
        viewModel.isEditLocationHidden
            .bind(to: editLocationView.rx.isHidden)
            .disposed(by: disposeBag)
        
        editButton.rx.tap
            .bind(onNext: viewModel.showEditLocation)
            .disposed(by: disposeBag)
        
        editLocationView.actionButton.rx.tap
            .bind(onNext: editLocation)
            .disposed(by: disposeBag)
        
        editLocationView.cancelButton.rx.tap
            .bind(onNext: viewModel.cancelEditLocation)
            .disposed(by: disposeBag)
    }
    
    private func setupSubviews() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(addressLabel)
        stackView.addArrangedSubview(latLabel)
        stackView.addArrangedSubview(longLabel)
        stackView.addArrangedSubview(editButton)
        
        view.addSubview(locationImageView)
        view.addSubview(stackView)
        view.addSubview(editLocationView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            locationImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            locationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: locationImageView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            editLocationView.widthAnchor.constraint(equalToConstant: 200),
            editLocationView.heightAnchor.constraint(equalToConstant: 200),
            editLocationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            editLocationView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configure(with location: Location) {
        locationImageView.setLocationImage(URL(string: location.image ?? ""))
        nameLabel.text = location.label
        addressLabel.text = "Address: " + location.address
        latLabel.text = "lat: \(String(describing: location.latitude ?? location.lat ?? 0))"
        longLabel.text = "long: \(String(describing: location.longitude ?? location.lng ?? 0))"
    }
    
    private func editLocation() {
        // Get New information
        viewModel.editLocation()
    }

}
