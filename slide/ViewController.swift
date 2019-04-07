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
    
    //次へボタンの表示をisenabledするためoutlet接続
    @IBOutlet weak var nextbutton2: UIButton!
    
    //再生・停止ボタンの表示を切り替えるためoutlet接続
    @IBOutlet weak var startStopButton: UIButton!
    
    //戻るボタンの表示をisenabledするためoutlet接続
    @IBOutlet weak var previousbutton2: UIButton!
    
    //segueで遷移先へ移行するためoutlet接続
    @IBOutlet weak var nextfieldbutton: UIButton!
    
    //???
    var timer: Timer!
    
    //再生停止ボタンのタップ回数をカウントするため、宣言
    var tapCount = 0
    
    
    //変数timer_sec(型Float) ＝０宣言
    var timer_sec:Float = 0
    
    //次へボタンをAction接続。ImageViewを触るため必要。
    @IBAction func nextbutton(_ sender: Any)
    {
        //表示した画像の番号を１増やす
        dispImageNo += 1
        
        //displayImage関数の呼び出し実行
        displayImage()
    }

    //戻るボタンをAction接続。imageViewを触るため必要
    @IBAction func prevbutton(_ sender: Any) {
        
        //表示した画像の番号を１減らす
        dispImageNo -= 1
        
        //displayImage関数の呼び出し実行
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
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        self.timer!.invalidate()
        let resultViewController = segue.destination as! ResultViewController
       resultViewController.image = imageView.image
    }
    
    @objc func updateTimer(_ timer: Timer){
        if tapCount % 2 == 0 {
            startStopButton.setTitle("再生", for: .normal)
            nextbutton2.isEnabled = true
            previousbutton2.isEnabled = true
            self.timer.invalidate()
        
            }
        else  {nextbutton2.isEnabled = false
            previousbutton2.isEnabled = false
            startStopButton.setTitle("停止", for: .normal)
            let imageNameArray = ["image1.jpg","image2.jpg","image3.jpeg"]
            let name = imageNameArray[dispImageNo]
            let image = UIImage(named: name)
            self.imageView.image = image
            dispImageNo += 1
            if dispImageNo > 2{
                dispImageNo = 0
            
            }
            }
        
    }
    
    @IBAction func startTimer(_ sender: Any) {
        tapCount += 1
    self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
}



