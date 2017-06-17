//
//  ChatViewController.swift
//  Spajam2017D
//
//  Created by junpei ono on 2017/06/17.
//  Copyright © 2017年 junpei ono. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

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
        
        let url:String = "https://onsen-hackathon-rails-server.herokuapp.com/api/v0/rooms/room1"
        
        Alamofire.request(url, method: .get).responseJSON{ response in
            
            switch response.result {
            case .success:
                let json:JSON = JSON(response.result.value ?? kill)
                
                //print(json)
                
                
                for i in 0..<json.count {
                    
                    var comment = Dictionary<String,String>()
                    comment["username"] = json[i]["username"].stringValue
                    comment["message"] = json[i]["message"].stringValue
                    
                    print(json[i]["message"].stringValue)
                    self.comments.append(comment)
                }
                
                self.chatTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
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
        print(comment2)
        
        
        if indexPath.row % 2 == 0 {
            let cell:RightChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(RightChatTableViewCell.self), for: indexPath) as! RightChatTableViewCell
            cell.commentLabel.text = comment2["message"]
            // cellの背景を透過
            cell.backgroundColor = UIColor.clear
            // cell内のcontentViewの背景を透過
            cell.contentView.backgroundColor = UIColor.clear
            cell.layoutMargins = UIEdgeInsets.zero
            cell.preservesSuperviewLayoutMargins = false
            return cell
        }else{
            let cell:LeftChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(LeftChatTableViewCell.self), for: indexPath) as! LeftChatTableViewCell
            cell.commentLabel.text = comment2["message"]
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
