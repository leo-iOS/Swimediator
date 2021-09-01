//
//  Service2ViewController.swift
//  Swimediator_Example

import UIKit
import SnapKit
import Swimediator

class Service2ViewController: BaseViewController {
    var serviceId: String
    required init(serviceId: String) {
        self.serviceId = serviceId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "serviceId:" + serviceId
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override func injector1Action() {
        let vc = MediatorManager.getObject(aProtocol: Service1Protocol.self)
        self.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }
    
    override func injector2Action() {
        let vc = MediatorManager.getObject(aProtocol: Service2Protocol.self, arg1: "Service2ToService2")
        self.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }

    override func injector3Action() {
        let vc = MediatorManager.getObject(aProtocol: Service3Protocol.self, arg1: "service2", arg2: "service3")
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
        let obj = try? MediatorManager.routerURL(route: "swi://service2/router_Service2ToService2")
        guard let vc = obj as? UIViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func router3Action() {
        let obj = try? MediatorManager.routerURL(route: "swi://service3?from=router_Service2&to=router_Service3")
        guard let vc = obj as? UIViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
