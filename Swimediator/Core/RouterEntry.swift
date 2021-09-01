//
//  RouterEntry.swift
//  Swimediator
//
//  Created by leo on 2021/7/16.
//

import UIKit

class RouterEntry: NSObject {
    var pattern: URL
    var handler: (([String:String]) -> (AnyObject?))
    init(pattern: URL, handler: @escaping ([String:String]) -> (AnyObject?)) {
        self.pattern = pattern
        self.handler = handler
    }
}
