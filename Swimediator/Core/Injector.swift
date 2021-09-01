//
//  Injector.swift
//  Swimediator
//
//  Created by leo on 2021/7/1.
//

import UIKit

class InternalInjector: Provider {
    
    unowned var manager: MediatorManager!
    
    static let defaultInjector: InternalInjector = {
        let injector = InternalInjector()
        return injector
    }()
    
    private var context: [String:MInjectorEntry] = [:]
    
    private var binders: [InjectorModuleBinder] = []
    
    private init() {}
    
    public func addModule(_ module: MediatorModule) {
        let binder = InternalInjectorModuleBinder()
        module.binding(binder: binder)
        module.routing(router: self.manager.router, provider: self)
        binders.append(binder)
        for (k, v) in binder.bindings {
            context[k] = v
        }
    }
    
    func addModules(_ modules: [MediatorModule]) {
        for module in modules {
            addModule(module)
        }
    }
    
    func getObject(aProtocol: Protocol) -> AnyObject? {
        let key = Utilities.protocolKey(aProtocol: aProtocol)
        guard let injectorCls = context[key] else { return nil}
        return injectorCls.getObject()
    }
    
    func getObject<Arg1>(aProtocol: Protocol, arg1: Arg1) -> AnyObject? {
        let key = Utilities.protocolKey(aProtocol: aProtocol, hasArg1: true)
        guard let injectorCls = context[key] else { return nil}
        return injectorCls.getObject(arg1: arg1)
    }
    
    func getObject<Arg1, Arg2>(aProtocol: Protocol, arg1: Arg1, arg2: Arg2) -> AnyObject? {
        let key = Utilities.protocolKey(aProtocol: aProtocol, hasArg1: true)
        guard let injectorCls = context[key] else { return nil}
        return injectorCls.getObject(arg1: arg1, arg2: arg2)
    }
    
    func getObject<Arg1, Arg2, Arg3>(aProtocol: Protocol, arg1: Arg1, arg2: Arg2, arg3: Arg3) -> AnyObject? {
        let key = Utilities.protocolKey(aProtocol: aProtocol, hasArg1: true)
        guard let injectorCls = context[key] else { return nil}
        return injectorCls.getObject(arg1: arg1, arg2: arg2, arg3: arg3)
    }
}
