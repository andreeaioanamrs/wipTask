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
    }
    
    private func setupSubviews() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(addressLabel)
        stackView.addArrangedSubview(latLabel)
        stackView.addArrangedSubview(longLabel)
        
        view.addSubview(locationImageView)
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            locationImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            locationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: locationImageView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configure(with location: Location) {
        locationImageView.setLocationImage(URL(string: location.image ?? ""))
        nameLabel.text = location.label
        addressLabel.text = "Address: " + location.address
        latLabel.text = "lat: \(String(describing: location.latitude ?? location.lat ?? 0))"
        longLabel.text = "long: \(String(describing: location.longitude ?? location.lng ?? 0))"
    }

}
