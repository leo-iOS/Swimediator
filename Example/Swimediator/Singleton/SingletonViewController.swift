//
//  SingletonViewController.swift
//  Swimediator_Example


import Foundation
import UIKit
import SnapKit

class SingletonViewController: UIViewController  {
    
    lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("dismiss", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    @objc func buttonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        view.addSubview(dismissButton)
        dismissButton.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
        }
        
        label.text = self.description
        view.addSubview(label)
        label.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.top.equalTo(dismissButton.snp.bottom).offset(20)
        }
        
    }
    
}
