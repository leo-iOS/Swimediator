//
//  SingletonModule.swift
//  Swimediator_Example
//
//  Created by leo on 2021/9/1.
//

import Foundation
import Swimediator

let singletonURL = "swi://singleton"

@objc protocol SingletonProtocol {}

class SingletonModule: MediatorModule {
    func routing(router: Router, provider: Provider) {
        try? router.map(route: singletonURL) { (params) -> AnyObject? in
            return provider.getObject(aProtocol: SingletonProtocol.self)
        }
    }
    
    func binding(binder: InjectorModuleBinder) {
        binder.bindClass(cls: SingletonViewController.classForCoder(), to: SingletonProtocol.self, withScope: .singleton) { () -> AnyObject in
            let vc = SingletonViewController()
            return vc
        }
    }
}
