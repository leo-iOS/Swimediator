//
//  Service3Module.swift
//  Swimediator_Example


import Swimediator

let service3URL = "swi://service3?from=:from&to=:to"

class Service3Module: MediatorModule {
    func routing(router: Router, provider: Provider) {
        try? router.map(route: service3URL) { (params) -> AnyObject? in
            guard let from = params["from"], let to = params["to"] else { return nil }
            return provider.getObject(aProtocol: Service3Protocol.self, arg1: from, arg2: to)
        }
    }
    
    func binding(binder: InjectorModuleBinder) {
        binder.bindClass(cls: Service3ViewController.classForCoder(), to: Service3Protocol.self) { (arg1: String, arg2: String) -> AnyObject in
            let vc = Service3ViewController(from: arg1, to: arg2)
            return vc
        }
    }
}
