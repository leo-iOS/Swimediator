//
//  AppDelegate.swift
//  Swimediator

import UIKit
import Swimediator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        MediatorManager.addModules([Service1Module(), Service2Module(), Service3Module()])
        return true
    }

}

