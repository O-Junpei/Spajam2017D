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
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        let goChatVCBtn:UIButton = UIButton()
        goChatVCBtn.frame =  CGRect(x: 0, y: 0, width: 100, height: 100)
        goChatVCBtn.backgroundColor = UIColor.red
        goChatVCBtn.addTarget(self, action: #selector(goChatVCBtnClicked(sender:)), for:.touchUpInside)
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

