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
    }
    
    private func setupSubviews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

