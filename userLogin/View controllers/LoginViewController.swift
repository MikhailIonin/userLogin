//
//  LoginViewController.swift
//  userLogin
//
//  Created by Ионин Михаил Викторович on 31.03.2021.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    //MARK: Private properties
    private let user = User.getUserData()
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewContollers = tabBarController.viewControllers else { return }
    
        viewContollers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoViewController
                userInfoVC.user = user
            }
        }
    }
   
    //MARK: IB Actions
    @IBAction func logInAction() {
        if userNameTF.text == user.login && passwordTF.text == user.password {
            performSegue(withIdentifier: "showTabViewController", sender: nil)
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
        userNameTF.text = nil
        passwordTF.text = nil
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


