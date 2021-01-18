//
//  ViewController.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 17/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, BindableType {
    
    var viewModel: HomeViewModel!
    private let disposeBag = DisposeBag()
    
    private let collectionView: UICollectionView = {
        let collectionView = IntrinsicCollectionView(frame: .zero,
                                                     collectionViewLayout: .listCollectionViewFlowLayout())
        collectionView.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: "locationCell")
        collectionView.backgroundColor = .white
        collectionView.allowsMultipleSelection = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let addLocationView = AddLocationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        edgesForExtendedLayout = []

        setupSubviews()
        setupConstraints()
    }
    
    func bindViewModel() {
        viewModel.locations
            .bind(to: collectionView.rx.items) { collectionView, row, location -> LocationCollectionViewCell in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell",
                                                                    for: IndexPath(row: row, section: 0)) as? LocationCollectionViewCell else { return LocationCollectionViewCell() }
                
                cell.configure(with: location)
                return cell
            }
            .disposed(by: disposeBag)
        
        collectionView.rx.itemSelected
            .map({ $0.row })
            .bind(onNext: { [weak self] row in self?.viewModel.showDetails(forLocationAt: row) })
            .disposed(by: disposeBag)
        
        viewModel.isAddLocationHidden
            .bind(to: addLocationView.rx.isHidden)
            .disposed(by: disposeBag)
        
        addLocationView.cancelButton.rx.tap
            .bind(onNext: viewModel.cancelAddLocation)
            .disposed(by: disposeBag)
        
        addLocationView.addButton.rx.tap
            .bind(onNext: addLocation)
            .disposed(by: disposeBag)
    }
    
    private func setupSubviews() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: viewModel,
                                                                 action: #selector(viewModel.showAddLocation))
        view.addSubview(collectionView)
        view.addSubview(addLocationView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            addLocationView.widthAnchor.constraint(equalToConstant: 200),
            addLocationView.heightAnchor.constraint(equalToConstant: 200),
            addLocationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addLocationView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func addLocation() {
        let name = addLocationView.nameTextField.text
        let address = addLocationView.addressTextField.text
        let lat = Double(addLocationView.latTextField.text ?? "")
        let lng = Double(addLocationView.lngTextField.text ?? "")
        
        viewModel.addNewLocation(name, address: address, lat: lat, lng: lng)
    }

}

