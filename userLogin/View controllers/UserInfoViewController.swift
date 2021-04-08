//
//  UserInfoViewController.swift
//  userLogin
//
//  Created by Ионин Михаил Викторович on 07.04.2021.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet var informationTF: UILabel!
    @IBOutlet var hobbyTF: UILabel!
    
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = user.person.fullName
        informationTF.text = user.person.information
        hobbyTF.text = user.person.hobby
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
        
    }
}
  
