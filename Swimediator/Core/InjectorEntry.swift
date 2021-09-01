//
//  InjectorEntry.swift
//  Swimediator
//
//  Created by leo on 2021/7/16.
//

import UIKit

internal class MInjectorEntry {
    //MARK: - init
    init(cls: AnyClass, scope: InjectorScope) {
        self.cls = cls
        self.scope = scope
        if self.scope == .singleton {
            lock = NSLock()
        }
    }
    
    internal func getObject() -> AnyObject? {
        if scope == .singleton {
            if _singleton == nil {
                lock?.lock()
                if _singleton == nil {
                    _singleton = _getObject()
                }
                lock?.unlock()
            }
            return _singleton!
        } else {
            return _getObject()
        }
    }
    
    internal func getObject<Arg1>(arg1: Arg1) -> AnyObject? {
        if scope == .singleton {
            if _singleton == nil {
                lock?.lock()
                if _singleton == nil {
                    _singleton = _getObject(arg1: arg1)
                }
                lock?.unlock()
            }
            return _singleton!
        } else {
            return _getObject(arg1: arg1)
        }
    }
    
    internal func getObject<Arg1, Arg2>(arg1: Arg1, arg2: Arg2) -> AnyObject? {
        if scope == .singleton {
            if _singleton == nil {
                lock?.lock()
                if _singleton == nil {
                    _singleton = _getObject(arg1: arg1, arg2: arg2)
                }
                lock?.unlock()
            }
            return _singleton!
        } else {
            return _getObject(arg1: arg1, arg2: arg2)
        }
    }
    
    internal func getObject<Arg1, Arg2, Arg3>(arg1: Arg1, arg2: Arg2, arg3: Arg3) -> AnyObject? {
        if scope == .singleton {
            if _singleton == nil {
                lock?.lock()
                if _singleton == nil {
                    _singleton = _getObject(arg1: arg1, arg2: arg2, arg3: arg3)
                }
                lock?.unlock()
            }
            return _singleton!
        } else {
            return _getObject(arg1: arg1, arg2: arg2, arg3: arg3)
        }
    }
    
    //MARK: - private var
    var cls: AnyClass
    var scope: InjectorScope
    var _entry0: Any? // _InjectorEntry0
    var _entry1: Any? // _InjectorEntry1
    var _entry2: Any? // _InjectorEntry2
    var _entry3: Any? // _InjectorEntry3
    var lock: NSLock?
    var _singleton: AnyObject?
    
    //MARK: - private
    private func _getObject() -> AnyObject? {
        guard let entry = self._entry0 as? _InjectorEntry0 else {
            return (self.cls as! NSObject.Type).init()
        }
        return entry.block()
    }
    
    private func _getObject<Arg1>(arg1: Arg1) -> AnyObject? {
        guard let entry = self._entry1 as? _InjectorEntry1<Arg1> else {
            return nil
        }
        return entry.block(arg1)
    }
    
    private func _getObject<Arg1, Arg2>(arg1: Arg1, arg2: Arg2) -> AnyObject? {
        guard let entry = self._entry2 as? _InjectorEntry2<Arg1, Arg2> else {
            return nil
        }
        return entry.block(arg1, arg2)
    }
    
    private func _getObject<Arg1, Arg2, Arg3>(arg1: Arg1, arg2: Arg2, arg3: Arg3) -> AnyObject? {
        guard let entry = self._entry2 as? _InjectorEntry3<Arg1, Arg2, Arg3> else {
            return nil
        }
        return entry.block(arg1, arg2, arg3)
    }
}

class _InjectorEntry0: NSObject {
   var block: (() -> (AnyObject))
   init(block: @escaping (() -> (AnyObject))) {
       self.block = block
   }
}

class _InjectorEntry1<Arg1>: NSObject {
   var block: ((_ arg1: Arg1) -> (AnyObject))
   init(block: @escaping ((_ arg1: Arg1) -> (AnyObject))) {
       self.block = block
   }
}

class _InjectorEntry2<Arg1, Arg2>: NSObject {
   var block: ((_ arg1: Arg1, _ arg2: Arg2) -> (AnyObject))
   init(block: @escaping ((_ arg1: Arg1, _ arg2: Arg2) -> (AnyObject))) {
       self.block = block
   }
}

class _InjectorEntry3<Arg1, Arg2, Arg3>: NSObject {
   var block: ((_ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> (AnyObject))
   init(block: @escaping ((_ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> (AnyObject))) {
       self.block = block
   }
}
