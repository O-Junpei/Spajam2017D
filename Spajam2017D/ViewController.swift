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
    
    //
    var roomNameTextField:UITextField = UITextField()
    var userNameTextField:UITextField = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面横サイズを取得
        self.viewWidth = self.view.frame.width
        self.viewHeight = self.view.frame.height
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        setView()
    }
    
    //ビューに道具を登録する
    func setView(){
        //Viewの背景色を設定
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background_choice")?.draw(in: self.view.bounds)
        let viewImage: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: viewImage)
        
        //解説のラベル
        let descriptionLabel:UILabel = UILabel()
        descriptionLabel.text = "メッセージをやり取りするには\nルーム名、自分の名前を\n入力してください"
        descriptionLabel.frame =  CGRect(x: viewWidth*0.1, y: viewHeight*0.19, width: viewWidth*0.8, height: 5)
        descriptionLabel.textAlignment = NSTextAlignment.center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.sizeToFit()
        self.view.addSubview(descriptionLabel)
        
        //ルーム名
        let roomNameLabel:UILabel = UILabel()
        roomNameLabel.text = "ルーム名"
        roomNameLabel.frame =  CGRect(x: viewWidth*0.1, y: viewHeight*0.38, width: viewWidth*0.8, height: viewHeight*0.05)
        self.view.addSubview(roomNameLabel)
        
        //ルーム名のテキストフィールド
        roomNameTextField.frame = CGRect(x: viewWidth*0.1, y: viewHeight*0.43, width: viewWidth*0.8, height: viewHeight*0.08)
        roomNameTextField.text = "ルーム名を入力してください"
        roomNameTextField.textColor = UIColor.gray
        roomNameTextField.backgroundColor = UIColor.white
        //titleTextField.borderStyle = UITextBorderStyle.roundedRect
        self.view.addSubview(roomNameTextField)
        
        //ユーザー名
        let userNameLabel:UILabel = UILabel()
        userNameLabel.text = "名前"
        userNameLabel.frame =  CGRect(x: viewWidth*0.1, y: viewHeight*0.56, width: viewWidth*0.8, height: viewHeight*0.05)
        self.view.addSubview(userNameLabel)
        
        //ルーム名のテキストフィールド
        userNameTextField.frame = CGRect(x: viewWidth*0.1, y: viewHeight*0.62, width: viewWidth*0.8, height: viewHeight*0.1)
        userNameTextField.text = "名前"
        userNameTextField.textColor = UIColor.gray
        userNameTextField.backgroundColor = UIColor.white
        self.view.addSubview(userNameTextField)
        
        //ボタン
        let goChatVCBtn:UIButton = UIButton()
        goChatVCBtn.frame = CGRect(x: viewWidth*0.1, y: viewHeight*0.8, width: viewWidth*0.8, height: viewWidth*0.2)
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
    


}

