//
//  LibrosTableViewController.swift
//  segundoEntregable
//
//  Created by iOS on 18/10/18.
//  Copyright © 2018 iOS. All rights reserved.
//

import UIKit

protocol BookDelegate {
    func addNewBook(_ book: Book,_ categoria: Category)
    func reduceQuantity(from cell: UITableViewCell)
    func incrementQuantity(from cell: UITableViewCell)
    
}


class LibrosTableViewController: UITableViewController, BookDelegate {


    
    var lasCategorias: [Category] = []
    
    var imagenes = ["iOSLogo", "androidLogo", "webLogo", "otrosLogo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
          let categoryArray = PlistManager.readArray(name: "libros")
        
        for aCategoryDictionary in categoryArray {
            let newCategory = Category(with: aCategoryDictionary)
            lasCategorias.append(newCategory)
        }
       
        
    }
        
    
    func addNewBook(_ book: Book,_ categoria: Category) {
        for i in lasCategorias {
            if i.getCategoryname() == categoria.getCategoryname() {
                i.addBookInCategory(book: book)
                tableView.reloadData()
                break
            }
        }
        
    }
    
    func reduceQuantity(from cell: UITableViewCell) {
                if let indexPath = tableView.indexPath(for: cell) {
                    let book = lasCategorias[indexPath.section].getBookArray()[indexPath.row]
                    book.reduceInStock()
                        tableView.reloadRows(at: [indexPath], with: .bottom)
                   }
        
    }
    
    func incrementQuantity(from cell: UITableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let book = lasCategorias[indexPath.section].getBookArray()[indexPath.row]
            book.addInStock()
            tableView.reloadRows(at: [indexPath], with: .top)
        }
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return lasCategorias.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return lasCategorias[section].getBookArray().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        
        let book = lasCategorias[indexPath.section].getBookArray()[indexPath.row]
        
        if let customCell = cell as? LibroTableViewCell {
            customCell.setup(with: book, delegate: self)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            
            if let posicionSeleccionada = tableView.indexPathForSelectedRow {
                
                let elLibroSeleccionado = lasCategorias[posicionSeleccionada.section].getBookArray()[posicionSeleccionada.row]
                
                destination.book = elLibroSeleccionado
                destination.category = lasCategorias[posicionSeleccionada.section]
            }
        }
        
        if let destination = segue.destination as? AgregarLibroViewController {
           destination.categoryArray = lasCategorias
            destination.elAddDelegate = self
        }
    }

    //empieza la parte del destacado
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nib = Bundle.main.loadNibNamed("SectionHeaderView", owner: self, options: nil)
        let theView = nib?.first
        if let headerView = theView as? SectionHeaderView {
            headerView.setup(imageName: imagenes[section], title: lasCategorias[section].getCategoryname(), quantity: lasCategorias[section].getBookArray().count)
            
            return headerView
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let nib = Bundle.main.loadNibNamed("SectionHeaderView", owner: self, options: nil)
        let theView = nib?.first
        if let headerView = theView as? SectionHeaderView {
            return headerView.frame.size.height
        }
        return 0
    }
    
    
    
}
