//
//  BaseViewController.swift
//  Swimediator_Example

import UIKit
import SnapKit

let buttonWidth: CGFloat = 120
let buttonHeight: CGFloat = 45

class BaseViewController: UIViewController {
    
    lazy var injectorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "injector"
        return label
    }()
    
    lazy var injectorButton1: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(injector1Action), for: .touchUpInside)
        return button
    }()
    
    lazy var injectorButton2: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(injector2Action), for: .touchUpInside)
        return button
    }()
    
    lazy var injectorButton3: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(injector3Action), for: .touchUpInside)
        return button
    }()
    
    lazy var routerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "router"
        return label
    }()
    
    lazy var routerButton1: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(router1Action), for: .touchUpInside)
        return button
    }()
    
    lazy var routerButton2: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(router2Action), for: .touchUpInside)
        return button
    }()
    
    lazy var routerButton3: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(router3Action), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let className = type(of: self).description().components(separatedBy: ".").last
        if let _className = className {
            let count = _className.count -  "ViewController".count
            let endIndex = _className.index(_className.startIndex, offsetBy: count)
            let title = _className[_className.startIndex..<endIndex]
            self.title = String(title)
        }
        
        injectorButton1.setTitle("to service1", for: UIControlState.normal)
        injectorButton2.setTitle("to service2", for: UIControlState.normal)
        injectorButton3.setTitle("to service3", for: UIControlState.normal)
        
        routerButton1.setTitle("to service1", for: UIControlState.normal)
        routerButton2.setTitle("to service2", for: UIControlState.normal)
        routerButton3.setTitle("to service3", for: UIControlState.normal)
        
        addInjectorViews()
        addRouterViews()
    }
    
    func addInjectorViews() {
        view.addSubview(injectorLabel)
        view.addSubview(injectorButton1)
        view.addSubview(injectorButton2)
        view.addSubview(injectorButton3)
        injectorLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(120)
        }
        injectorButton2.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(injectorLabel.snp.bottom).offset(15)
            maker.width.equalTo(buttonWidth)
            maker.height.equalTo(buttonHeight)
        }
        injectorButton1.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(injectorButton2)
            maker.trailing.equalTo(injectorButton2.snp.leading).offset(-20)
            maker.width.equalTo(buttonWidth)
            maker.height.equalTo(buttonHeight)
        }
        injectorButton3.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(injectorButton2)
            maker.leading.equalTo(injectorButton2.snp.trailing).offset(20)
            maker.width.equalTo(buttonWidth)
            maker.height.equalTo(buttonHeight)
        }
    }

    func addRouterViews() {
        view.addSubview(routerLabel)
        view.addSubview(routerButton1)
        view.addSubview(routerButton2)
        view.addSubview(routerButton3)
        
        routerLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(injectorButton2.snp.bottom).offset(50)
        }
        routerButton2.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(routerLabel.snp.bottom).offset(15)
            maker.width.equalTo(buttonWidth)
            maker.height.equalTo(buttonHeight)
        }
        routerButton1.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(routerButton2)
            maker.trailing.equalTo(routerButton2.snp.leading).offset(-20)
            maker.width.equalTo(buttonWidth)
            maker.height.equalTo(buttonHeight)
        }
        routerButton3.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(routerButton2)
            maker.leading.equalTo(routerButton2.snp.trailing).offset(20)
            maker.width.equalTo(buttonWidth)
            maker.height.equalTo(buttonHeight)
        }
    }
    
    @objc func injector1Action() {}
    
    @objc func injector2Action() {}
    
    @objc func injector3Action() {}
    
    @objc func router1Action() {}
    
    @objc func router2Action() {}
    
    @objc func router3Action() {}
}
