//
//  ImageViewController.swift
//  userLogin
//
//  Created by Ионин Михаил Викторович on 08.04.2021.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: user.person.image)
    
    }
}
