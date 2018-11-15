//
//  LibroTableViewCell.swift
//  segundoEntregable
//
//  Created by iOS on 18/10/18.
//  Copyright © 2018 iOS. All rights reserved.
//

import UIKit

class LibroTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    
    var elDelegate: BookDelegate?

    
    func setup(with book: Book, delegate: BookDelegate) {
        elDelegate = delegate
        
        titleLabel.text = book.getTitle()
        authorLabel.text = book.getAuthor()
        stockLabel.text = "\(book.getStock())"
    }
    
    @IBAction func reduceQuantity(_ sender: Any) {
        elDelegate?.reduceQuantity(from: self)
      
    }
    
    @IBAction func incrementQuantity(_ sender: Any) {
        elDelegate?.incrementQuantity(from: self)
    }
}
