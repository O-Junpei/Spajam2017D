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

        commentLabel.font = UIFont.systemFont(ofSize: 12)
        //commentLabel.text = "左載せる"
        commentLabel.textColor = UIColor.gray
        commentLabel.textAlignment = NSTextAlignment.center
        commentLabel.textColor = UIColor.black
        commentLabel.backgroundColor = UIColor.appGray()
        commentLabel.layer.cornerRadius = 16
        commentLabel.clipsToBounds = true
    }
    
    
}
