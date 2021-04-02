//
//  LoginViewController.swift
//  userLogin
//
//  Created by Ионин Михаил Викторович on 31.03.2021.
//

import UIKit

let userName = "User"
let userPassword = "123"

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
    }

    @IBAction func logInAction(_ sender: Any) {
        
        if userNameTF.text == userName && passwordTF.text == userPassword {
            print("Access granted")
        } else {
            showAlert(with: "Wrong!", and: "Access denied")
            userNameTF.text = ""
            passwordTF.text = ""
        }
    }
    
    @IBAction func forgotUserName() {
        showAlert(with: "Oops!", and: "Your name is User")
        return
    }
    
    @IBAction func forgotPassowrd() {
        showAlert(with: "Oops!", and: "Your password is 123")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let welcomeVC = unwindSegue.source as? WelcomeViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}

// MARK: Alert controller
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
