//
//  Service1ViewController.swift
//  Swimediator_Example


import UIKit
import Swimediator

class Service1ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func injector1Action() {
        let vc = MediatorManager.getObject(aProtocol: Service1Protocol.self)
        self.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }
    
    override func injector2Action() {
        let vc = MediatorManager.getObject(aProtocol: Service2Protocol.self, arg1: "Service1ToService2")
        self.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }

    override func injector3Action() {
        let vc = MediatorManager.getObject(aProtocol: Service3Protocol.self, arg1: "service1", arg2: "service3")
        self.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }
    
    override func router1Action() {
        let obj = try? MediatorManager.routerURL(route: "swi://service1")
        guard let vc = obj as? UIViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func router2Action() {
        let obj = try? MediatorManager.routerURL(route: "swi://service2/router_Service1ToService2")
        guard let vc = obj as? UIViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func router3Action() {
        let obj = try? MediatorManager.routerURL(route: "swi://service3?from=router_Service1&to=router_Service3")
        guard let vc = obj as? UIViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
