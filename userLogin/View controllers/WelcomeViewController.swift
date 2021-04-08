//
//  WelcomeViewController.swift
//  userLogin
//
//  Created by Ионин Михаил Викторович on 31.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(user.person.fullName)!"
    }
}
