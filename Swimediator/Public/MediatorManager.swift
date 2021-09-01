//
//  MediatorManager.swift
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

public final class MediatorManager {
    
    static let manager: MediatorManager = MediatorManager()
    
    //MARK: - public method
    //MARK: router
    public func map(route: String, handler: @escaping ([String:String]) -> (AnyObject?)) throws {
        try self.router.map(route: route, handler: handler)
    }
    
    public func removeAllRoutes() {
        self.router.removeAllRoutes()
    }
    
    public func routerURL(route: String) throws -> AnyObject? {
        return try self.router.routerURL(route: route)
    }
    
    //MARK: injector
    public func addModule(_ module: MediatorModule) {
        self.injector.addModule(module)
    }
    
    public func addModules(_ modules: [MediatorModule]) {
        self.injector.addModules(modules)
    }
    
    //MARK:  provider
    public func getObject(aProtocol: Protocol) -> AnyObject? {
        return self.injector.getObject(aProtocol: aProtocol)
    }

    public func getObject<Arg1>(aProtocol: Protocol, arg1: Arg1) -> AnyObject? {
       return MediatorManager.manager.injector.getObject(aProtocol: aProtocol, arg1: arg1)
    }
    
    public func getObject<Arg1, Arg2>(aProtocol: Protocol, arg1: Arg1, arg2: Arg2) -> AnyObject? {
        return self.injector.getObject(aProtocol: aProtocol, arg1: arg1, arg2: arg2)
    }
    
    public func getObject<Arg1, Arg2, Arg3>(aProtocol: Protocol, arg1: Arg1, arg2: Arg2, arg3: Arg3) -> AnyObject? {
        return self.injector.getObject(aProtocol: aProtocol, arg1: arg1, arg2: arg2, arg3: arg3)
    }
    
    //MARK: - public static method
    //MARK: router
    static public func map(route: String, handler: @escaping ([String:String]) -> (AnyObject?)) throws {
        try MediatorManager.manager.router.map(route: route, handler: handler)
    }
    
    static public func removeAllRoutes() {
        MediatorManager.manager.router.removeAllRoutes()
    }
    
    static public func routerURL(route: String) throws -> AnyObject? {
        return try MediatorManager.manager.router.routerURL(route: route)
    }
    
    //MARK: injector
    static public func addModule(_ module: MediatorModule) {
        MediatorManager.manager.injector.addModule(module)
    }
    
    static public func addModules(_ modules: [MediatorModule]) {
        MediatorManager.manager.injector.addModules(modules)
    }
    
    //MARK:  provider
    static public func getObject(aProtocol: Protocol) -> AnyObject? {
        return MediatorManager.manager.injector.getObject(aProtocol: aProtocol)
    }

    static public func getObject<Arg1>(aProtocol: Protocol, arg1: Arg1) -> AnyObject? {
       return MediatorManager.manager.injector.getObject(aProtocol: aProtocol, arg1: arg1)
    }
    
    static public func getObject<Arg1, Arg2>(aProtocol: Protocol, arg1: Arg1, arg2: Arg2) -> AnyObject? {
        return MediatorManager.manager.injector.getObject(aProtocol: aProtocol, arg1: arg1, arg2: arg2)
    }
    
    static public func getObject<Arg1, Arg2, Arg3>(aProtocol: Protocol, arg1: Arg1, arg2: Arg2, arg3: Arg3) -> AnyObject? {
        return MediatorManager.manager.injector.getObject(aProtocol: aProtocol, arg1: arg1, arg2: arg2, arg3: arg3)
    }
    
    //MARK: - private
    var router: InternalRouter {
        return InternalRouter.shared
    }
    
    var injector: InternalInjector {
        let injector = InternalInjector.defaultInjector
        injector.manager = self
        return injector
    }
    
}
