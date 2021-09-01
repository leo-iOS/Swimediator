//
//  Provider.swift
//  Swimediator
//
//  Created by leo on 2021/9/1.
//

public protocol Provider { 
    func getObject(aProtocol: Protocol) -> AnyObject?
    
    func getObject<Arg1>(aProtocol: Protocol, arg1: Arg1) -> AnyObject?
    
    func getObject<Arg1, Arg2>(aProtocol: Protocol, arg1: Arg1, arg2: Arg2) -> AnyObject?
    
    func getObject<Arg1, Arg2, Arg3>(aProtocol: Protocol, arg1: Arg1, arg2: Arg2, arg3: Arg3) -> AnyObject?
}
