//
//  ChatViewController.swift
//  Spajam2017D
//
//  Created by junpei ono on 2017/06/17.
//  Copyright © 2017年 junpei ono. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //width, height
    private var viewWidth:CGFloat!
    private var viewHeight:CGFloat!
    
    //View
    var chatTableView:UITableView! = UITableView()
    
    //Datas
    var comments:Array<Dictionary<String,String>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面横サイズを取得
        self.viewWidth = self.view.frame.width
        self.viewHeight = self.view.frame.height
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        setDatas()
        setView()
        
    }
    
    
    
    func setDatas() {
        
        var comment0 = Dictionary<String,String>()
        comment0["user"] = "onojun"
        comment0["comment"] = "こんばんは、純平だよ"
        comments.append(comment0)
        
        var comment1 = Dictionary<String,String>()
        comment1["user"] = "user name"
        comment1["comment"] = "こんばんは、プレゼントありがとう"
        comments.append(comment1)
        
        var comment2 = Dictionary<String,String>()
        comment2["user"] = "onojun"
        comment2["comment"] = "あまーーーーーーーーーーいでしょ"
        comments.append(comment2)
        
        var comment3 = Dictionary<String,String>()
        comment3["user"] = "user name"
        comment3["comment"] = "あばんは、プレゼントありがょ"
        comments.append(comment3)
        
        var comment4 = Dictionary<String,String>()
        comment4["user"] = "user name"
        comment4["comment"] = "こんばんは、プレゼントありがとう"
        comments.append(comment4)
        
        var comment5 = Dictionary<String,String>()
        comment5["user"] = "onojun"
        comment5["comment"] = "あばんは、プレゼントありがでしょ"
        comments.append(comment5)
        
        var comment6 = Dictionary<String,String>()
        comment6["user"] = "user name"
        comment6["comment"] = "あまーーばんは、プレゼントありがいでしょ"
        comments.append(comment6)
    }
    
    func setView() {
        //Viewの背景色を設定
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background_talk")?.draw(in: self.view.bounds)
        let backGroundImage: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: backGroundImage)
        
        //戻るボタン
        let backBtn:UIButton = UIButton()
        backBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        backBtn.setImage(UIImage(named: "back"), for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(backButtonClicked(sender:)), for:.touchUpInside)
        self.view.addSubview(backBtn)
        
        // make UIImageView instance
        
        
        //chatTableView = UITableView()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.frame = CGRect(x: 0, y: PARTS_HEIGHT_STATUS_BAR+PARTS_HEIGHT_NAVIGATION_BAR, width: viewWidth, height: viewHeight-(PARTS_HEIGHT_STATUS_BAR+PARTS_HEIGHT_NAVIGATION_BAR))
        let tableBackGroundImage = UIImage(named: "table")
        let tableBackImageView = UIImageView(frame: self.view.frame)
        tableBackImageView.image = tableBackGroundImage
        tableBackImageView.alpha = 1.0
        chatTableView.backgroundView = tableBackImageView
        chatTableView.separatorColor = UIColor.clear
        chatTableView.allowsSelection = false
        chatTableView.separatorInset = UIEdgeInsets.zero
        chatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        chatTableView.register(RightChatTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(RightChatTableViewCell.self))
        chatTableView.register(LeftChatTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(LeftChatTableViewCell.self))
        self.view.addSubview(chatTableView)
        
    }
        
    
    
    // MARK: - Button Action
    
    //basicボタンが押されたら呼ばれます
    func backButtonClicked(sender: UIButton){
        print("basicButtonBtnClicked")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: - TableViewのデリゲートメソッド

    //高さの設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    //MARK: テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        return comments.count
    }
    
    
    
    //MARK: テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        
        var comment2 = Dictionary<String,String>()
        comment2 = comments[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            let cell:RightChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(RightChatTableViewCell.self), for: indexPath) as! RightChatTableViewCell
            cell.commentLabel.text = comment2["comment"]
            // cellの背景を透過
            cell.backgroundColor = UIColor.clear
            // cell内のcontentViewの背景を透過
            cell.contentView.backgroundColor = UIColor.clear
            cell.layoutMargins = UIEdgeInsets.zero
            cell.preservesSuperviewLayoutMargins = false
            return cell
        }else{
            let cell:LeftChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(LeftChatTableViewCell.self), for: indexPath) as! LeftChatTableViewCell
            cell.commentLabel.text = comment2["comment"]
            // cellの背景を透過
            cell.backgroundColor = UIColor.clear
            // cell内のcontentViewの背景を透過
            cell.contentView.backgroundColor = UIColor.clear
            cell.layoutMargins = UIEdgeInsets.zero
            cell.preservesSuperviewLayoutMargins = false
            return cell
            
        }
        
        
    }
    
    
    // MARK: - シェイクが検出されたら呼ばれる
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == UIEventSubtype.motionShake {
            print("Device was shaked")
        }
    }

}
