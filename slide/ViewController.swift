//
//  ViewController.swift
//  slide
//
//  Created by USER on 2019/04/01.
//  Copyright © 2019 sf. All rights reserved.
//

//UIKitのインポート
import UIKit

// サブクラス：スーパークラス
class ViewController: UIViewController {

    
    //Imageviewをoutlet接続。後のIBactionでImageViewの画像をいじるため恐らく必要。
    @IBOutlet weak var imageView: UIImageView!
    
    
    var timer: Timer!
    
    
    //変数timer_sec(型Float) ＝０宣言
    var timer_sec:Float = 0
    
    //次へボタンをAction接続。ImageViewを触るため必要。
    @IBAction func nextbutton(_ sender: Any) {
        //表示した画像の番号を１増やす
        dispImageNo += 1
        
        displayImage()
    }

    @IBAction func prevbutton(_ sender: Any) {
        //表示した画像の番号を１減らす
        dispImageNo -= 1
        
        displayImage()
        
    }
    
    //変数名dispImageNoを０で宣言
    var dispImageNo = 0
    
    //関数displayImageのメソッド記述
    func displayImage(){
        //定数imageNameArrayを配列として纏めておく
        let imageNameArray = [
        "image1.jpg","image2.jpg","image3.jpeg"]
        
        //dispImageNoが０より小さい時に値を２にする。
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        //dispImageNoが2より大きい時に値を０とする。
        if dispImageNo > 2{
            dispImageNo = 0
        }
        //定数名nameの宣言。nameへimageNameArray配列[no]を代入
        let name = imageNameArray[dispImageNo]
        //????????
        let image = UIImage(named: name)
        //????????
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 2.0
        let imageNameArray = ["image1.jpg","image2.jpg","image3.jpeg"]
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        self.imageView.image = image
        self.timer_sec += 2.0
        dispImageNo += 1
        if dispImageNo > 2{
            dispImageNo = 0
        }
        
    }
    
    @IBAction func startTimer(_ sender: Any) {
    self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
}



