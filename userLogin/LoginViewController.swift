//
//  LoginViewController.swift
//  userLogin
//
//  Created by Ионин Михаил Викторович on 31.03.2021.
//

import UIKit



class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let userName = "User"
    private let userPassword = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = userNameTF.text
    }

    @IBAction func logInAction() {
        
        if userNameTF.text == userName && passwordTF.text == userPassword {
            print("Access granted")
            
            performSegue(withIdentifier: "showWelcomeViewController", sender: nil)
        } else {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login and password")
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

// MARK: - Work with keyboard
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInAction()
        }
        return true
    }
}
