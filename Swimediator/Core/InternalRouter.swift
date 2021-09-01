//
//  Router.swift
//  Swimediator
//
//  Created by leo on 2021/7/16.
//

import UIKit
class InternalRouter: Router {
    
    
    var provider: Provider?
    
    //MARK: - singleton
    public static let shared = InternalRouter()
    
    private let _entryKey = "entryKey"
    private var routerMap: NSMutableDictionary = NSMutableDictionary()
    private init() {}
    
//    func map(route: String, handler: @escaping ([String:String]) -> ()) throws {
//        guard let url = URL(string: route) else {
//            throw RouterError.invalidURL
//        }
//        let entry = RouterEntry(pattern: url, handler: handler)
//        let pathComponents = self.pathComponents(in: route)
//        insertRoute(entry: entry, pathComponents: pathComponents, routeMap: self.routerMap)
//    }
    
    func map(route: String, handler: @escaping ([String : String]) -> (AnyObject?)) throws {
        guard let url = URL(string: route) else {
            throw RouterError.invalidURL
        }
        let entry = RouterEntry(pattern: url, handler: handler)
        let pathComponents = self.pathComponents(in: route)
        insertRoute(entry: entry, pathComponents: pathComponents, routeMap: self.routerMap)
    }
    
    func removeAllRoutes() {
        self.routerMap.removeAllObjects()
    }
    
    func routerURL(route: String) throws  -> AnyObject? {
        var params: [String:String] = [:]
        guard let entry = try findEntry(from: route, params: &params) else { return nil }
        let extraParams = try paramsInRoute(route: route)
        for (k, v) in extraParams {
            params[k] = v
        }
        let obj = entry.handler(params)
        return obj
    }
    
    //MARK: - private
    private func insertRoute(entry: RouterEntry, pathComponents: [String], routeMap: NSMutableDictionary, index: Int = 0) {
        guard index < pathComponents.count else {
            return
        }
        let path = pathComponents[index]
        if routeMap[path] == nil {
            
            if path == pathComponents.last {
                let dic = NSMutableDictionary()
                dic[_entryKey] = entry
                routeMap[path] = dic
                return
            }
            let dic = NSMutableDictionary()
            routeMap[path] = dic
        }
        
        insertRoute(entry: entry, pathComponents: pathComponents, routeMap: routeMap[path] as! NSMutableDictionary, index: index+1)
    }
    
    private func findEntry(from route: String, params: inout [String:String]) throws -> RouterEntry? {
        let paths = pathComponents(in: route)
        var routeMap = self.routerMap
        for path in paths {
            for (k, v) in routeMap {
                if routerMap[path] != nil {
                    if path == paths.last {
                        guard let entryMap = routeMap[path] as? NSMutableDictionary else {
                            throw RouterError.invalidMap
                        }
                        guard let entry = entryMap[_entryKey] as? RouterEntry else {
                            throw RouterError.invalidMap
                        }
                        return entry
                    }
                    routeMap = routeMap[path] as! NSMutableDictionary
                    break
                }
                guard let k = k as? String else {
                    throw RouterError.invalidMap
                }
                
                if k.hasPrefix(":") {
                    let key = k[k.index(after: k.startIndex)..<k.endIndex]
                    params[String(key)] = path
                    if path == paths.last {
                        guard let v = v as? NSMutableDictionary else {
                            throw RouterError.invalidMap
                        }
                        guard let entry = v[_entryKey] as? RouterEntry else {
                            throw RouterError.invalidMap
                        }
                        return entry
                    }
                    routeMap = routeMap[path] as! NSMutableDictionary
                    break
                }
            }
        }
        return nil
    }
    
    private func paramsInRoute(route: String) throws -> [String:String] {
        guard let url = URL(string: route) else {
            throw RouterError.invalidURL
        }
        var params: [String:String] = [:]
        
        if let query = url.query {
            let kvs = query.components(separatedBy: CharacterSet(arrayLiteral: "&"))
            for kv in kvs {
                let kvArr = kv.components(separatedBy: CharacterSet(arrayLiteral: "="))
                if kvArr.count != 2 {
                    throw RouterError.invalidParams
                }
                params[kvArr[0]] = kvArr[1]
            }
        }
        return params
    }
    
    // 包含url的host和pathComponenets
    public func pathComponents(in route: String) -> [String] {
        let url = URL(string: route)!
        var result: [String] = []
        if let host = url.host {
            result.append(host)
        }
        let pathComponents = url.pathComponents
        for path in pathComponents {
            if path != "/" {
                result.append(path)
            }
        }
        return result
    }
    
    
}
