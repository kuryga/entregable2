//
//  SectionHeaderViewController.swift
//  segundoEntregable
//
//  Created by Andrés  on 21/10/18.
//  Copyright © 2018 iOS. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {

    
    @IBOutlet weak var headerNameLabel: UILabel!
    
    @IBOutlet weak var headerQuantityLabel: UILabel!
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    
    func setup(imageName: String, title: String, quantity: Int) {
        headerImageView.image = UIImage(named: imageName)
        headerNameLabel.text = title
        headerQuantityLabel.text = "\(quantity)"
    }
}
