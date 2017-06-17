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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面横サイズを取得
        self.viewWidth = self.view.frame.width
        self.viewHeight = self.view.frame.height
        
        //self.view.backgroundColor = UIColor.white
        /*
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.draw(in: self.view.bounds)
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        */
        
        // make UIImageView instance
        let imageView = UIImageView(frame: self.view.frame)
        // read image
        let image = UIImage(named: "background")
        // set image to ImageView
        imageView.image = image
        // set alpha value of imageView
        imageView.alpha = 0.5
        // set imageView to backgroundView of TableView
        chatTableView.backgroundView = imageView
        
        
        //
        //chatTableView = UITableView()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        chatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        chatTableView.register(RightChatTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(RightChatTableViewCell.self))
        chatTableView.register(LeftChatTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(LeftChatTableViewCell.self))
        self.view.addSubview(chatTableView)
    }
    
    
    // MARK: - TableViewのデリゲートメソッド
    //MARK: テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        return 3
    }
    
    //MARK: テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        
        let cell:RightChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(RightChatTableViewCell.self), for: indexPath) as! RightChatTableViewCell
        
        
        cell.commentLabel.text = "self.myItems[indexPath.row] as? String"
        
        // cellの背景を透過
        cell.backgroundColor = UIColor.clear
        // cell内のcontentViewの背景を透過
        cell.contentView.backgroundColor = UIColor.clear
        return cell
    }

}
