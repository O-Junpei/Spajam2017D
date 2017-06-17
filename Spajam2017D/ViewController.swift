//
//  ViewController.swift
//  Spajam2017D
//
//  Created by junpei ono on 2017/06/17.
//  Copyright © 2017年 junpei ono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //width, height
    private var viewWidth:CGFloat!
    private var viewHeight:CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面横サイズを取得
        self.viewWidth = self.view.frame.width
        self.viewHeight = self.view.frame.height
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        //Viewの背景色を設定
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.draw(in: self.view.bounds)
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        //解説のラベル
        let descriptionLabel:UILabel = UILabel()
        descriptionLabel.text = "メッセージをやり取りするには\nルーム名、自分の名前\n入力してください"
        descriptionLabel.frame =  CGRect(x: viewWidth*0.1, y: 40, width: viewWidth*0.8, height: 5)
        descriptionLabel.textAlignment = NSTextAlignment.center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.sizeToFit()
        self.view.addSubview(descriptionLabel)
        
        //ボタン
        let goChatVCBtn:UIButton = UIButton()
        goChatVCBtn.frame = CGRect(x: viewWidth*0.1, y: viewHeight*0.6, width: viewWidth*0.8, height: viewWidth*0.2)
        goChatVCBtn.backgroundColor = UIColor.appRightGreen()
        goChatVCBtn.addTarget(self, action: #selector(goChatVCBtnClicked(sender:)), for:.touchUpInside)
        goChatVCBtn.setTitle("つながる", for: UIControlState.normal)
        self.view.addSubview(goChatVCBtn)
    }
    // MARK: - チャットボタンが押されたら呼ばれる
    func goChatVCBtnClicked(sender: UIButton){
        
        //画面遷移、投稿詳細画面へ
        let chatVC: ChatViewController = ChatViewController()
        //picDetailView.postID = sender.view?.tag
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    
    
    // MARK: - シェイクが検出されたら呼ばれる
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == UIEventSubtype.motionShake {
            print("Device was shaked")
        }
    }

}

