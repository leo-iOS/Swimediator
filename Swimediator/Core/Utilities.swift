//
//  Utilities.swift
//  Swimediator
//
//  Created by leo on 2021/7/16.
//

import UIKit
public enum InjectorScope {
    case unknown
    case prototype
    case singleton
}

class Utilities: NSObject {
    public static func protocolKey(aProtocol: Protocol, hasArg1: Bool = false, hasArg2: Bool = false, hasArg3: Bool = false) -> String {
        var key = NSStringFromProtocol(aProtocol)
        if hasArg1 { key += "<arg1>" }
        if hasArg2 && hasArg1 { key += "<arg2>" }
        if hasArg3 && hasArg2 && hasArg1 { key += "<arg3>" }
        return key
    }
}
