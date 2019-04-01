//
//  ViewController.swift
//  slide
//
//  Created by USER on 2019/04/01.
//  Copyright © 2019 sf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func nextButton(_ sender: Any) {
        dispImageNo -= 1
        displayImage()
    }
    
    @IBAction func prevbutton(_ sender: Any) {
        dispImageNo += 1
        displayImage()
        
    }
    var dispImageNo = 0
    func displayImage(){
        let imageNameArray = [
        "firstimage","secondimage","thirdimage"]
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        if dispImageNo > 2{
            dispImageNo = 0
        }
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "image1")
        imageView.image = image
    }


}

