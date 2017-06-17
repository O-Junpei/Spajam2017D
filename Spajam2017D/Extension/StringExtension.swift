//
//  StringExtension.swift
//  Spajam2017D
//
//  Created by junpei ono on 2017/06/18.
//  Copyright © 2017年 junpei ono. All rights reserved.
//

import UIKit

extension String {
    func toBool() -> Bool? {
        switch self {
        case "TRUE", "True", "true", "YES", "Yes", "yes", "1":
            return true
        case "FALSE", "False", "false", "NO", "No", "no", "0":
            return false
        default:
            return nil
        }
    }
}
