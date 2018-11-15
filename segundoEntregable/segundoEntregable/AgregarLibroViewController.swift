//
//  AgregarLibroViewController.swift
//  segundoEntregable
//
//  Created by iOS on 18/10/18.
//  Copyright © 2018 iOS. All rights reserved.
//

import UIKit

class AgregarLibroViewController: UIViewController {

    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var authorTextfield: UITextField!
    @IBOutlet weak var isbnTextfield: UITextField!
    @IBOutlet weak var priceTextfield: UITextField!
    @IBOutlet weak var languageTextfield: UITextField!
    @IBOutlet weak var stockTextfield: UITextField!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    var elAddDelegate: BookDelegate?
    
    var categoryArray: [Category]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categorySegmentedControl.removeAllSegments()
        
        if let array = categoryArray{
            for i in array {
            categorySegmentedControl.insertSegment(withTitle: i.getCategoryname(), at: array.count, animated: false)
            
            }
        }
        
    /*
         var category = Category(categoryName: "iOS")
        categoryArray.append(category)
        categorySegmentedControl.insertSegment(withTitle: category.getCategoryname(), at: categoryArray.count, animated: false)
         category = Category(categoryName: "Android")
        categoryArray.append(category)
        categorySegmentedControl.insertSegment(withTitle: category.getCategoryname(), at: categoryArray.count, animated: false)
         category = Category(categoryName: "Web")
        categoryArray.append(category)
        categorySegmentedControl.insertSegment(withTitle: category.getCategoryname(), at: categoryArray.count, animated: false)
         category = Category(categoryName: "Otros")
        categoryArray.append(category)
        categorySegmentedControl.insertSegment(withTitle: category.getCategoryname(), at: categoryArray.count, animated: false)
        */
        // Do any additional setup after loading the view.
 
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        if let title = titleTextfield.text, let author = authorTextfield.text, let isbn = isbnTextfield.text, let price = priceTextfield.text, let language = languageTextfield.text, let stock = stockTextfield.text  {
            
            let newBook = Book(title: title, author: author, isbn: isbn, language: language , price: Double(price) ?? 0.0, stock: Int(stock) ?? 0)
            let segment = categorySegmentedControl.selectedSegmentIndex
            if segment != -1 {
                if let array = categoryArray {
                    elAddDelegate?.addNewBook(newBook, array[segment])
                }
                } else {
                if let array = categoryArray{
                    elAddDelegate?.addNewBook(newBook, array[categorySegmentedControl.numberOfSegments - 1])
                }
            }

            navigationController?.popViewController(animated: true)
        }
 
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
