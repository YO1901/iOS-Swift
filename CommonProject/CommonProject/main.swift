//
//  main.swift
//  CommonProject
//
//  Created by Yerlan Omarov on 24.02.2022.
//

import Foundation

protocol MobileStorage {
    func getAll() -> Set<Mobile>
    func findByImei(_ imei: String) -> Mobile?
    func save(_ mobile: Mobile) throws -> Mobile
    func delete(_ product: Mobile) throws
    func exists(_ product: Mobile) -> Bool
}

struct Mobile: Hashable {
    let imei: String
    let model: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(imei)
    }
}

extension Mobile: Equatable {
    static func ==(_ lhs: Mobile, _ rhs: Mobile) -> Bool {
        lhs.imei == rhs.imei
    }
}

enum StorageError: Error {
    case couldNotSave
    case couldNotDelete
}

class MyStorage: MobileStorage {
    private var data: Set<Mobile>
    
    init() {
        self.data = Set<Mobile>()
    }
    
    func getAll() -> Set<Mobile> {
        Set(data)
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        data.first(where: { $0.imei == imei })
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        guard !exists(mobile) else {
            throw StorageError.couldNotSave
        }
        data.insert(mobile)
        return mobile
    }
    
    func delete(_ product: Mobile) throws {
        guard exists(product) else {
            throw StorageError.couldNotDelete
        }
        data.remove(product)
    }
    
    func exists(_ product: Mobile) -> Bool {
        data.contains(product)
    }
}

let storage = MyStorage()

let a = Mobile(imei: "1", model: "iphone")
let b = Mobile(imei: "2", model: "iphone")
let c = Mobile(imei: "2", model: "samsung")
let d = Mobile(imei: "3", model: "samsung")

do {
    try
    storage.save(a)
    try
    storage.save(b)
    try
    storage.save(c)
} catch {
    print(error)
}
do {
    try
    storage.delete(d)
} catch {
    print(error)
}
print(storage.getAll())
