//
//  InternalInjectorModuleBinder.swift
//  Swimediator
//
//  Created by leo on 2021/7/16.
//

import UIKit

internal final class InternalInjectorModuleBinder: InjectorModuleBinder {
    
    internal var bindings: [String:MInjectorEntry] = [:]
    
    
    func bindClass(cls: AnyClass, to aProtocol: Protocol) {
        bindClass(cls: cls, to: aProtocol, withBlock: nil)
    }
    
    func bindClass(cls: AnyClass, to aProtocol: Protocol, withBlock block: (() -> AnyObject)?) {
        bindClass(cls: cls, to: aProtocol, withScope: .prototype, withBlock: block)
    }
    
    func bindClass(cls: AnyClass, to aProtocol: Protocol, withScope scope: InjectorScope = .prototype, withBlock block: (() -> AnyObject)? = nil) {
        let injetorClass = MInjectorEntry(cls: cls, scope: scope)
        if block != nil {
            injetorClass._entry0 = _InjectorEntry0(block: block!)
        }
        let key = Utilities.protocolKey(aProtocol: aProtocol)
        bindings[key] = injetorClass
    }
    
    func bindClass<Arg1>(cls: AnyClass, to aProtocol: Protocol, withBlock block: @escaping (Arg1) -> AnyObject) {
        let injetorClass = MInjectorEntry(cls: cls, scope: .prototype)
        injetorClass._entry1 = _InjectorEntry1<Arg1>(block: block)
        let key = Utilities.protocolKey(aProtocol: aProtocol, hasArg1: true)
        bindings[key] = injetorClass
    }
    
    func bindClass<Arg1, Arg2>(cls: AnyClass, to aProtocol: Protocol, withBlock block: @escaping (Arg1, Arg2) -> AnyObject) {
        let injetorClass = MInjectorEntry(cls: cls, scope: .prototype)
        injetorClass._entry2 = _InjectorEntry2<Arg1, Arg2>(block: block)
        let key = Utilities.protocolKey(aProtocol: aProtocol, hasArg1: true)
        bindings[key] = injetorClass
    }
    
    func bindClass<Arg1, Arg2, Arg3>(cls: AnyClass, to aProtocol: Protocol, withBlock block: @escaping (Arg1, Arg2, Arg3) -> AnyObject) {
        let injetorClass = MInjectorEntry(cls: cls, scope: .prototype)
        injetorClass._entry3 = _InjectorEntry3<Arg1, Arg2, Arg3>(block: block)
        let key = Utilities.protocolKey(aProtocol: aProtocol, hasArg1: true)
        bindings[key] = injetorClass
    }
}
