//
//  LoginViewController.swift
//  segundoEntregable
//
//  Created by Andrés  on 21/10/18.
//  Copyright © 2018 iOS. All rights reserved.
//

import UIKit



class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBAction func EntryTapped(_ sender: Any) {
       
            if  usernameTextfield.text != "" {
                let controller = storyboard?.instantiateViewController(withIdentifier: "BookTable") as? LibrosTableViewController
            
                    if let destination = controller {
                navigationController?.pushViewController(destination, animated: true)
                        
                    }
            }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
