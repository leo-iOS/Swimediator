//
//  MediatorModule.swift
//  Swimediator
//
//  Created by leo on on 2021/7/16.
//

import UIKit

public protocol MediatorModule {
    
    func binding(binder: InjectorModuleBinder)
    
    func routing(router: Router, provider: Provider)
    
}





