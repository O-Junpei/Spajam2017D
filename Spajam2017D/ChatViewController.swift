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
import SCLAlertView

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //ChatInfo
    var roomName:String!
    var userName:String!
    var isPerfume:Bool = false
    
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
        
        comments = []
        let url:String = "https://onsen-hackathon-rails-server.herokuapp.com/api/v0/rooms/" + String(roomName)
        
        Alamofire.request(url, method: .get).responseJSON{ response in
            
            switch response.result {
            case .success:
                let json:JSON = JSON(response.result.value ?? kill)
                
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
        backBtn.frame = CGRect(x: viewWidth*0.04, y: viewWidth*0.07, width: viewWidth*0.1, height: viewWidth*0.1)
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
        
        
        //投稿ボタン
        let addBtn:UIButton = UIButton()
        addBtn.frame = CGRect(x: viewWidth*0.75, y: viewHeight*0.85, width: viewWidth*0.2, height: viewWidth*0.2)
        addBtn.setImage(UIImage(named:"plus"), for: UIControlState.normal)
        addBtn.addTarget(self, action: #selector(addButtonClicked(sender:)), for: .touchUpInside)
        self.view.addSubview(addBtn)
        
        //投稿ボタン
        let reloadBtn:UIButton = UIButton()
        reloadBtn.frame = CGRect(x: viewWidth*0.8, y: 0, width: viewWidth*0.1, height: viewWidth*0.1)
        reloadBtn.backgroundColor = UIColor.blue
        reloadBtn.addTarget(self, action: #selector(reloadBtnClicked(sender:)), for: .touchUpInside)
        self.view.addSubview(reloadBtn)
        
    }
        
    
    // MARK: - Button Action
    //backボタンが押されたら呼ばれます
    func backButtonClicked(sender: UIButton){
        print("basicButtonBtnClicked")
        self.navigationController?.popViewController(animated: true)
    }
    
    //basicボタンが押されたら呼ばれます
    func addButtonClicked(sender: UIButton){
        
        let alert = SCLAlertView()
        let txt = alert.addTextField("メッセージを入力")
        alert.addButton("送信") {
            
            let sendMessage:String! = String(describing: txt.text!)
            //print(sendMessage)
            self.sentMessage(message: sendMessage)
        }
        alert.showEdit("メッセージ送信", subTitle: "メッセージを入力してください。")
    }
    
    //basicボタンが押されたら呼ばれます
    func reloadBtnClicked(sender: UIButton){
        setDatas()
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
        var comment = Dictionary<String,String>()
        comment = comments[indexPath.row]
        
        if comment["username"] == userName {
            let cell:RightChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(RightChatTableViewCell.self), for: indexPath) as! RightChatTableViewCell
            
            var cellWidth:CGFloat = CGFloat(comment["message"]!.characters.count*20)
            if cellWidth > viewWidth*0.9{
                cellWidth = viewWidth*0.9
            }
            
            cell.commentLabel.text = comment["message"]
            
            cell.commentLabel.frame = CGRect(x: viewWidth-(cellWidth+viewWidth*0.05), y: 80*0.35, width:  cellWidth, height: 80*0.6)
                        
            // cellの背景を透過
            cell.backgroundColor = UIColor.clear
            // cell内のcontentViewの背景を透過
            cell.contentView.backgroundColor = UIColor.clear
            cell.layoutMargins = UIEdgeInsets.zero
            cell.preservesSuperviewLayoutMargins = false
            
            return cell
        }else{
            let cell:LeftChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(LeftChatTableViewCell.self), for: indexPath) as! LeftChatTableViewCell
            
            var cellWidth:CGFloat = CGFloat(comment["message"]!.characters.count*20)
            if cellWidth > viewWidth*0.9{
                cellWidth = viewWidth*0.9
            }
            
            
            cell.commentLabel.frame = CGRect(x: viewWidth*0.05, y: 80*0.35, width: cellWidth, height: 80*0.6)
            cell.commentLabel.text = comment["message"]
            // cellの背景を透過
            cell.backgroundColor = UIColor.clear
            // cell内のcontentViewの背景を透過
            cell.contentView.backgroundColor = UIColor.clear
            cell.layoutMargins = UIEdgeInsets.zero
            cell.preservesSuperviewLayoutMargins = false
            return cell
            
        }
    }
    
    
    func sentMessage(message:String){
        
        let parameters: Parameters = [
            "username": userName,
            "message": message,
            "perfume": false
        ]
        
        let url:String = "https://onsen-hackathon-rails-server.herokuapp.com/api/v0/rooms/" + String(roomName)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                
                let json:JSON = JSON(response.result.value ?? kill)
                print(json)
                self.setDatas()
                
            case .failure(let error):
                print(error)
                //テーブルの再読み込み
            }
        }
    }
    
    
    // MARK: - シェイクが検出されたら呼ばれる
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == UIEventSubtype.motionShake {
            print("Device was shaked")
            shakeOn()
        }
    }
    
    func shakeOn() {
        
        var url:String = "http://192.168.226.14/arduino/digital/13/"

        
        if isPerfume {
            isPerfume = false
            url += "0"
        }else{
            isPerfume = true
            url += "1"
        }
        
        Alamofire.request(url, method: .get).responseJSON{ response in
            
            switch response.result {
            case .success: break
                
            case .failure(let error):
                print(error)
            }
        }
    }

}
