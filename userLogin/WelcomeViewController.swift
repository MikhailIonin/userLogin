//
//  WelcomeViewController.swift
//  userLogin
//
//  Created by Ионин Михаил Викторович on 31.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName ?? "")"
        
    }
    @IBAction func logOutAction() {
        dismiss(animated: true)
    }
}
