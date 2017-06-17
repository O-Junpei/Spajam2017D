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
        
        //Viewの背景色を設定
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background_talk")?.draw(in: self.view.bounds)
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
        
        // make UIImageView instance
        var imageView = UIImageView(frame: self.view.frame)
        // read image
        let image2 = UIImage(named: "background_talk")
        // set image to ImageView
        imageView.image = image2
        // set alpha value of imageView
        imageView.alpha = 1.0
        // set imageView to backgroundView of TableView
        //self.tableView.backgroundView = imageView
        chatTableView.backgroundView = imageView
        
        /*
        
        // make UIImageView instance
        let imageView = UIImageView(frame: self.view.frame)
        // read image
        let image = UIImage(named: "background_talk")
        // set image to ImageView
        imageView.image = image
        // set alpha value of imageView
        imageView.alpha = 0.5
        // set imageView to backgroundView of TableView
        chatTableView.backgroundView = imageView
        */
        
        //
        //chatTableView = UITableView()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.frame = CGRect(x: 0, y: PARTS_HEIGHT_STATUS_BAR+PARTS_HEIGHT_NAVIGATION_BAR, width: viewWidth, height: viewHeight-(PARTS_HEIGHT_STATUS_BAR+PARTS_HEIGHT_NAVIGATION_BAR))
        chatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        chatTableView.register(RightChatTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(RightChatTableViewCell.self))
        chatTableView.register(LeftChatTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(LeftChatTableViewCell.self))
        self.view.addSubview(chatTableView)
    }
    
    
    
    func setDatas() {
        
        var comment0 = Dictionary<String,String>()
        comment0["user"] = "user name"
        comment0["comment"] = "00000commentcomment"
        comments.append(comment0)
        
        var comment1 = Dictionary<String,String>()
        comment1["user"] = "user name"
        comment1["comment"] = "1111commentcomment"
        comments.append(comment1)
        
        var comment2 = Dictionary<String,String>()
        comment2["user"] = "user name"
        comment2["comment"] = "2222commentcomment"
        comments.append(comment2)
        
        
        var comment3 = Dictionary<String,String>()
        comment3["user"] = "user name"
        comment3["comment"] = "333commentcomment"
        comments.append(comment3)
    }
    
    
    // MARK: - TableViewのデリゲートメソッド
    
    //高さの設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    //MARK: テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        return 3
    }
    
    
    
    //MARK: テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        
        if indexPath.row % 2 == 0 {
            let cell:RightChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(RightChatTableViewCell.self), for: indexPath) as! RightChatTableViewCell
            cell.commentLabel.text = "右"
            // cellの背景を透過
            cell.backgroundColor = UIColor.clear
            // cell内のcontentViewの背景を透過
            cell.contentView.backgroundColor = UIColor.clear
            return cell
        }else{
            let cell:LeftChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(LeftChatTableViewCell.self), for: indexPath) as! LeftChatTableViewCell
            cell.commentLabel.text = "左"
            // cellの背景を透過
            cell.backgroundColor = UIColor.clear
            // cell内のcontentViewの背景を透過
            cell.contentView.backgroundColor = UIColor.clear
            return cell
            
        }
        
        
    }

}
