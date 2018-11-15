//
//  Book.swift
//  segundoEntregable
//
//  Created by Andrés  on 18/10/18.
//  Copyright © 2018 iOS. All rights reserved.
//

import Foundation



public class Book {
    
    private var title: String
    private var author: String
    private var isbn: String
    private var language: String
    private var price: Double
    private var stock: Int
  
    public init(title: String, author: String, isbn: String, language: String, price: Double, stock: Int) {
        self.title = title
        self.author = author
        self.language = language
        self.isbn = isbn
        self.price = price
        self.stock = stock
    }
 
    public  init(with dictionary: [String : AnyObject?]) {
        self.title = dictionary["title"] as? String ?? "no name"
        self.author = dictionary["author"] as? String ?? "no name"
        self.isbn = dictionary["isbn"] as? String ?? "no isbn"
        self.language = dictionary["language"] as? String ?? "not available"
        self.price = dictionary["price"] as? Double ?? 0.0
        self.stock = dictionary["stock"] as? Int ?? 0
    }
 
    
    public func getTitle() -> String {
        return title
    }
    
    public func getAuthor() -> String {
        return author
    }
    
    public func getLanguage() -> String {
        return language
    }
    
    public func getIsbn() -> String {
        return isbn
    }
    
    public func getPrice() -> Double {
        return price
    }
    
    public func getStock() -> Int {
        return stock
    }
    
    public func addInStock()  {
        if stock >= 0 {
            self.stock =  stock + 1
        }
    }
    public func reduceInStock() {
        if stock >= 1 {
            self.stock = stock - 1
        }
    }
}




