//
//  UIImageView+wipTask.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 18/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setLocationImage(_ url: URL?) {
        image = nil
        
        kf.cancelDownloadTask()
        
        kf.setImage(with: url, placeholder: UIImage(named: "placeholderImage")) { result in
            if case .failure = result {
                self.image = UIImage(named: "placeholderImage")
            }
        }
    }
    
}
