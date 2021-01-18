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
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
           
        ])
    }

}

