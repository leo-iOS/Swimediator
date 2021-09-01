//
//  Service1Module.swift
//  Swimediator_Example

import Swimediator
// import Service1

let service1URL = "swi://service1"

class Service1Module: MediatorModule {
    func routing(router: Router, provider: Provider) {
        try? router.map(route: service1URL) { (_) in
            return provider.getObject(aProtocol: Service1Protocol.self)
        }
    }
    
    func binding(binder: InjectorModuleBinder) {
        binder.bindClass(cls: Service1ViewController.classForCoder(), to: Service1Protocol.self)
    }
}
