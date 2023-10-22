//
//  main.swift
//  SwiftTips
//
//  Created by Yerlan Omarov on 08.09.2023.
//

import Foundation

// MARK: Custom COW implementation
final class ReferenceContainer<T> {
    var value: T
    
    init(value: T) {
        self.value = value
    }
}

struct Box<ValueType> {
    private var rc: ReferenceContainer<ValueType>
    
    init(value: ValueType) {
        self.rc = ReferenceContainer(value: value)
    }
    
    var value: ValueType {
        get { rc.value }
        set {
            guard isKnownUniquelyReferenced(&rc) else {
                rc = ReferenceContainer(value: newValue)
                return
            }
            rc.value = newValue
        }
    }
}

// MARK: example of COW for custom array
//struct CustomArray<Element>: RandomAccessCollection {    
//
//}
