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
    var chatTableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面横サイズを取得
        self.viewWidth = self.view.frame.width
        self.viewHeight = self.view.frame.height
        
        self.view.backgroundColor = UIColor.white
        
        
        //
        chatTableView = UITableView()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        chatTableView.rowHeight = viewWidth*0.28
        chatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        chatTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(ChatTableViewCell.self))
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
        
        let cell:ChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ChatTableViewCell.self), for: indexPath) as! ChatTableViewCell
        
        
        cell.commentLabel.text = "self.myItems[indexPath.row] as? String"
        return cell
    }

}
