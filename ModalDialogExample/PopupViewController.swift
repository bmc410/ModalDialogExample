//
//  PopupViewController.swift
//  PresentrExample
//
//  Created by Daniel Lozano on 8/29/16.
//  Copyright © 2016 danielozano. All rights reserved.
//

import UIKit
import Presentr
import Eureka

class PopupViewController: FormViewController {

    
    func Close() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        form +++
            Section(){ section in
                section.header = {
                    var header = HeaderFooterView<UIView>(.callback({
                        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
                        view.backgroundColor = .lightText
                        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
                        self.view.addSubview(navBar);
                        let navItem = UINavigationItem();
                        navItem.title = "Login"
                        
                        let doneItem = UIBarButtonItem(image: UIImage(named: "close"), style: .done, target: nil, action: #selector(self.Close))
                        
                        navItem.rightBarButtonItem = doneItem;
                        navBar.setItems([navItem], animated: false);
                        view.addSubview(navBar)
                        return view
                    }))
                    header.height = { 45 }
                    return header
                }()
            }
            
            <<< NameRow() {
                $0.title = "Login:"
                $0.placeholder = "Login or email"
                }
            
            <<< NameRow() {
                $0.title = "Password:"
                $0.placeholder = "Password"
                }
        
            +++ Section()
            
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "Login"
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.showAlert()
            }
        
            +++ Section()
            
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "I don't have an account"
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.showAlert()
            }
        
        
        // Do any additional setup after loading the view.
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "OnCellSelection", message: "Button Row Action", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

// MARK: - Presentr Delegate

extension PopupViewController: PresentrDelegate {
    
    func presentrShouldDismiss(keyboardShowing: Bool) -> Bool {
        return !keyboardShowing
    }
    
}

// MARK: - UITextField Delegate

extension PopupViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
