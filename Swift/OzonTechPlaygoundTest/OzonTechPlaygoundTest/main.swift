//
//  main.swift
//  OzonTechPlaygoundTest
//
//  Created by Yerlan Omarov on 07.05.2022.
//

import Foundation

let collectionCount = Int(readLine() ?? "") ?? 0
var recordCount = 0
var requestCount = 0

var array: [String]?
var dependenciesList = [String: [String]]()
var i = 0
var j = 0
var k = 0
var key = ""
var requests = [String]()
var list = [String]()
var placeholder = ""
var ready = Set<String>()

while i < collectionCount {
    placeholder = readLine() ?? ""
    recordCount = Int(readLine() ?? "") ?? 0
    
    j = 0
    while j < recordCount {
        array = readLine()?.split(separator: Character(" ")).map(String.init)
        if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil {
            key = array!.first!
            key.removeLast()
            dependenciesList[key] = [String]()
            k = 1
            while k < array!.count {
                dependenciesList[key]!.append(array![k])
                k += 1
            }
        }
        j += 1
    }
    requestCount = Int(readLine() ?? "") ?? 0
    requests.removeAll()
    j = 0
    while j < requestCount {
        requests.append(readLine() ?? "")
        j += 1
    }
    ready.removeAll()
    for item in requests {
        list = getList(item).reversed()
        print(list.count, terminator: " ")
        for l in list {
            print(l, terminator: " ")
        }
        print()
        j += 1
    }
    print()
    i += 1
}


func getList(_ item: String) -> [String] {
    var result = [String]()
    if dependenciesList[item]!.isEmpty && !ready.contains(item) {
        result.append(item)
        ready.insert(item)
        return result
    }
    
    if !ready.contains(item) {
        result.append(item)
        ready.insert(item)
    }
    var sett = Set<String>()
    for elem in dependenciesList[item]! {
        for itt in getAllDependencies(elem) {
            sett.insert(itt)
        }
    }
    for elem in dependenciesList[item]! {
        if sett.contains
    }
    
    for elem in dependenciesList[item]! {
        if !ready.contains(elem) {
            result.append(elem)
            ready.insert(elem)
        }
    }
    
    for elem in dependenciesList[item]! {
        result += getList(elem)
    }
    
    return result
}

func getAllDependencies(_ item: String)  -> [String] {
    var result = [String]()
    if dependenciesList[item]!.isEmpty {
        return result
    }
    for elem in dependenciesList[item]! {
        result += getAllDependencies(elem)
    }
    return result
}
