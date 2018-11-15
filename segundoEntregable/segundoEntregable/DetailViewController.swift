//
//  DetailViewController.swift
//  segundoEntregable
//
//  Created by iOS on 18/10/18.
//  Copyright © 2018 iOS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailAuthorLabel: UILabel!
    @IBOutlet weak var detailIsbnLabel: UILabel!
    @IBOutlet weak var detailPriceLabel: UILabel!
    @IBOutlet weak var detailLanguageLabel: UILabel!
    @IBOutlet weak var detailStockLabel: UILabel!
    @IBOutlet weak var detailCategoryLabel: UILabel!
    
    var book: Book?
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let book = book {
            detailTitleLabel.text = book.getTitle()
            detailAuthorLabel.text = book.getAuthor()
            detailIsbnLabel.text = book.getIsbn()
            detailLanguageLabel.text = book.getLanguage()
            detailStockLabel.text = "\(book.getStock())"
            detailPriceLabel.text = "\(book.getPrice())"
        }
        if let category = category {
            detailCategoryLabel.text = category.getCategoryname()
        }
    }

}
