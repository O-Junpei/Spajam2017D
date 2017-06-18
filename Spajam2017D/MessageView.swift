//
//  MessageView.swift
//  Spajam2017D
//
//  Created by junpei ono on 2017/06/18.
//  Copyright © 2017年 junpei ono. All rights reserved.
//

import UIKit

class MessageView: UIView {
    
    var messageLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //アイコン
        messageLabel = UILabel()
        self.addSubview(messageLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let viewWidth:CGFloat = frame.width
        let viewHeight:CGFloat = frame.height
        messageLabel.frame = CGRect(x: viewWidth*0.05, y: viewHeight*0.05, width: viewWidth*0.9, height: viewHeight*0.9)
        
    }
}
