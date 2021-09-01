//
//  Service2Module.swift
//  Swimediator_Example

import UIKit
import Swimediator
//import Service2

let service2URL = "swi://service2/:serviceId"

class Service2Module: MediatorModule {
    func routing(router: Router, provider: Provider) {
        try? router.map(route: service2URL) { (params) in
            guard let serviceId = params["serviceId"] else {
                return nil
            }
            let vc = provider.getObject(aProtocol: Service2Protocol.self, arg1: serviceId)
            return vc
        }
    }
    
    func binding(binder: InjectorModuleBinder) {
        binder.bindClass(cls: Service2ViewController.classForCoder(), to: Service2Protocol.self) { (arg1: String) -> AnyObject in
            let vc = Service2ViewController(serviceId: arg1)
            return vc
        }
    }
}
