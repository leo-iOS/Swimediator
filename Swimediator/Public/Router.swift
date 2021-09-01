//
//  Router.swift
//  Swimediator
//
//  Created by leo on 2021/9/1.
//

public protocol Router {
    func map(route: String, handler: @escaping ([String:String]) -> AnyObject?) throws
}
