//
//  Category.swift
//  segundoEntregable
//
//  Created by Andrés  on 19/10/18.
//  Copyright © 2018 iOS. All rights reserved.
//

import Foundation


public class Category {
    private var categoryName: String
    private var categoryBooks: [Book] = []
    
  
    
    init(with dictionary: [String: AnyObject?]) {
        
        self.categoryName = dictionary["name"] as? String ?? "no name"
        
        let bookArray = dictionary["books"] as? [[String: AnyObject?]] ?? [[:]]
        
            for i in bookArray {
            self.categoryBooks.append(Book(with: i))
            }
    }
    
    public func getBookArray() -> [Book] {
        return categoryBooks
    }
    
    public func getCategoryname() -> String {
        return categoryName
    }
    public func addBookInCategory(book: Book) -> Void {
        return categoryBooks.append(book)
    }
}
