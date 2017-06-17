//
//  LeftChatTableViewCell.swift
//  Spajam2017D
//
//  Created by junpei ono on 2017/06/17.
//  Copyright © 2017年 junpei ono. All rights reserved.
//

import UIKit

class LeftChatTableViewCell: UITableViewCell {
    
    var commentLabel:UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(commentLabel)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cellWidth:CGFloat = self.frame.width
        let cellHeight:CGFloat = self.frame.height
        
        
        commentLabel.frame = CGRect(x: cellWidth*0.18, y: cellHeight*0.35, width: cellWidth*0.8, height: cellHeight*0.6)
        commentLabel.font = UIFont.systemFont(ofSize: 12)
        commentLabel.text = "天王寺動物園のサイさんを見ました。思ったより、大きかったです！！かっこよかったよ！！わたくし、結構サイってかっこいいと思うけど、評価されていない思うのよ"
        commentLabel.textColor = UIColor.gray
        
    }
    
    
}
