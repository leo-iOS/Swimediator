//
//  InjectorModuleBinder.swift
//  Swimediator
//
//  Created by leo on 2021/9/1.
//

public protocol InjectorModuleBinder {
    
    func bindClass(cls: AnyClass, to aProtocol: Protocol)
    
    func bindClass(cls: AnyClass, to aProtocol: Protocol, withBlock block: (() -> AnyObject)?)
    
    func bindClass(cls: AnyClass, to aProtocol: Protocol, withScope scope: InjectorScope, withBlock block: (() -> AnyObject)?)
    
    func bindClass<Arg1>(cls: AnyClass, to aProtocol: Protocol, withBlock block: @escaping (Arg1) -> AnyObject)
    
    func bindClass<Arg1, Arg2>(cls: AnyClass, to aProtocol: Protocol, withBlock block: @escaping (Arg1, Arg2) -> AnyObject)
    
    func bindClass<Arg1, Arg2, Arg3>(cls: AnyClass, to aProtocol: Protocol, withBlock block: @escaping (Arg1, Arg2, Arg3) -> AnyObject)
}
