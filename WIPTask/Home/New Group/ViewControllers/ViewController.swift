//
//  ViewController.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 17/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BindableType {
    
    var viewModel: HomeViewModel!
    
    private var collectionVIew: UICollectionView = {
        let collectionVIew = IntrinsicCollectionView(frame: .zero,
                                                     collectionViewLayout: .listCollectionViewFlowLayout())
        collectionVIew.backgroundColor = .white
        collectionVIew.allowsMultipleSelection = false
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        return collectionVIew
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        edgesForExtendedLayout = []

        setupSubviews()
        setupConstraints()
    }
    
    func bindViewModel() {
        
    }
    
    private func setupSubviews() {
        view.addSubview(collectionVIew)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionVIew.topAnchor.constraint(equalTo: view.topAnchor),
            collectionVIew.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionVIew.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionVIew.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

