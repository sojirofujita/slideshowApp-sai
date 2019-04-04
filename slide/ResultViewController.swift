//
//  ResultViewController.swift
//  slide
//
//  Created by USER on 2019/04/04.
//  Copyright © 2019 sf. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = self.image
    }
}
