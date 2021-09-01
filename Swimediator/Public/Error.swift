//
//  Error.swift
//  Swimediator
//
//  Created by leo on on 2021/7/16.
//

import UIKit

public enum RouterError: Error, CustomStringConvertible {
    case unknownScheme
    case invalidURL
    case invalidMap
    case invalidParams
    
    public var description: String {
        switch self {
        case .unknownScheme: return "unknown scheme"
        case .invalidURL: return "URL is invalid"
        case .invalidMap: return "Map is invalid"
        case .invalidParams: return "params is invalid"
        }
    }
}
