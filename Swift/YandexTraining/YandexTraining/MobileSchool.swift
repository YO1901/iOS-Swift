//
//  MobileSchool.swift
//  YandexTraining
//
//  Created by Yerlan Omarov on 27.04.2023.
//

import Foundation

func currentMobileSchool() {
    // I'm using force unwrap cause it is algorithm problem, without demand of error handling
    
    let n = Int(readLine()!)!
    let a = readLine()!.split(separator: Character(" ")).map(String.init).compactMap(Int.init)
    let b = readLine()!.split(separator: Character(" ")).map(String.init).compactMap(Int.init)
    var c = Array(repeating: 0, count: n)
    var d = Array(repeating: 0, count: n + 1)
    var result = -1
    
    var i = 0
    while i < n {
        c[i] = a[i] - b[i]
        if c[i] == 0 {
            result = 0
        }
        d[i + 1] = c[i] + d[i]
        if d[i + 1] == 0 && i > result {
            result = i
        }
        i += 1
    }
    
    i = 0
    while i < n {
        d[i + 1] -= c[0]
        if d[i + 1] == 0 && n - i - 1 > result {
            result = n - i - 1
        }
        i += 1
    }
    
    print(result)
}

func mex() {
    // I'm using force unwrap cause it is algorithm problem, without demand of error handling
    
    let count = Int(readLine()!)!
    
    let array = readLine()!.split(separator: Character(" ")).map(String.init).compactMap(Int.init)
        
    var result = 0
    
    if array[0] == 1 && array[count - 1] != 1 {
        result = (count - 1) * count / 2
    } else if array[0] == 1 && array[count - 1] == 1 || array[0] != 1 {
        result = (count + 1) * count / 2
    }
    print(result)
}

func standUp() {
    // I'm using force unwrap cause it is algorithm problem, without demand of error handling
    
    let laughTime = Int(readLine()!)!
    let count = Int(readLine()!)!
    
    let array = readLine()?.split(separator: Character(" ")).map(String.init).compactMap(Int.init)
    var sums = Array(repeating: 0, count: count)
    
    guard count != 0 else {
        print(laughTime)
        return
    }
    
    sums[count - 1] = array![count - 1]
    var result = laughTime * (count + 1)
    var i = count - 2
    while i > -1 {
        sums[i] = sums[i + 1] + array![i]
        let temp = sums[i] + laughTime * (i + 1)
        if result < temp {
            result = temp
        }
        i -= 1
    }
    
    print(result)
}

func crashFree() {
    // I'm using force unwrap cause it is algorithm problem, without demand of error handling
    
    let count = Int(readLine()!)!
    var i = 0
    var str = ""
    var id = 0
    var journal = [Int: Int]()
    var flag = 0
    var result = 0
    var totalCount = 0
    
    while i < count {
        str = readLine()!
        id = Int(readLine()!)!
        if str == "APPLICATION_FINISHED_LAUNCHING" {
            flag = 1
            totalCount += 1
        } else if str == "APPLICATION_TERMINATED" {
            flag = -1
        } else {
            flag = 0
        }
        
        journal[id, default: 0] += flag
        
        i += 1
    }
    
    for (_, value) in journal {
        if value != 0 {
            result += value
        }
    }
    print(Double(result) / Double(totalCount) * 100)
}

func mark() {
    // I'm using force unwrap cause it is algorithm problem, without demand of error handling
    
    var array = readLine()?.split(separator: Character(" ")).map(String.init).compactMap(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil {
        print(array!.sorted()[1])
    }
}
