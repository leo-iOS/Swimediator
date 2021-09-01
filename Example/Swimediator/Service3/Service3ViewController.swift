//
//  Service3ViewController.swift
//  Swimediator_Example

import Foundation
import Swimediator

class Service3ViewController: BaseViewController {
    
    let from: String
    let to: String
    
    lazy var fromLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var toLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    init(from: String, to: String) {
        self.from = from
        self.to = to
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromLabel.text = "from: " + from
        toLabel.text = "to: " + to
        view.addSubview(fromLabel)
        view.addSubview(toLabel)
        fromLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        toLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(fromLabel)
            make.top.equalTo(fromLabel.snp.bottom).offset(10)
        }
    }
    
    override func injector1Action() {
        let vc = MediatorManager.getObject(aProtocol: Service1Protocol.self)
        self.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }
    
    override func injector2Action() {
        let vc = MediatorManager.getObject(aProtocol: Service2Protocol.self, arg1: "Service2ToService3")
        self.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }

    override func injector3Action() {
        let vc = MediatorManager.getObject(aProtocol: Service3Protocol.self, arg1: "service3", arg2: "service3")
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
        let obj = try? MediatorManager.routerURL(route: "swi://service2/router_Service2ToService3")
        guard let vc = obj as? UIViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func router3Action() {
        let obj = try? MediatorManager.routerURL(route: "swi://service3?from=router_Service3&to=router_Service3")
        guard let vc = obj as? UIViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
