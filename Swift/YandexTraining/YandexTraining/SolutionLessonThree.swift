//
//  SolutionLessonThree.swift
//  YandexTraining
//
//  Created by Yerlan Omarov on 10.10.2021.
//

import Foundation

func aCoincideCount() {
    var a = Set<Int>()
    var b = Array<Int>()
    var count = 0
    
    var array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        for i in 0..<array!.count {
            a.insert(array![i]!)
        }
    }
    
    array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        for i in 0..<array!.count {
            b.append(array![i]!)
        }
    }
    
    for item in b {
        if a.contains(item) {
            count += 1
        }
    }
    print(count)
}

func bWasNumberbefore() {
    var a = Set<Int>()
    
    let array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        for i in 0..<array!.count {
            if a.contains(array![i]!) {
                print("YES")
            }
            else {
                a.insert(array![i]!)
                print("NO")
            }
        }
    }
}

func cUniqueElements() {
    var a = Set<Int>()
    var b = Set<Int>()
    
    let array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        for i in 0..<array!.count {
            if a.contains(array![i]!) {
                b.insert(array![i]!)
            }
            else {
                a.insert(array![i]!)
            }
        }
    }
    for i in 0..<array!.count {
        guard !b.contains(array![i]!) else {
            continue
        }
        print(array![i]!)
    }
}

func dGuessNumber() {
    var isNot = Set<Int>()
    var yes = Set<Int>()
    var newYes = Set<Int>()
    var request = ""
    var array: Array<Int?>?
    
    let n = Int(readLine() ?? "0")!
    request = readLine() ?? ""
    while request != "HELP" {
        array = request.split(separator: Character(" ")).map(String.init).map(Int.init)
        request = readLine() ?? ""
        switch request {
        case "YES":
            if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
                if yes.isEmpty {
                    for i in 0..<array!.count {
                        yes.insert(array![i]!)
                    }
                }
                else
                {
                    for i in 0..<array!.count {
                        if yes.contains(array![i]!) {
                            newYes.insert(array![i]!)
                        }
                    }
                    yes = newYes
                    newYes.removeAll()
                }
            }
        case "NO":
            if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
                for i in 0..<array!.count {
                    isNot.insert(array![i]!)
                }
            }
        default: break
        }
        request = readLine() ?? ""
    }
    print("here")
    for i in yes {
        print(i)
    }
    
    for i in isNot {
        print(i)
    }
    
    for i in 1..<n + 1 {
        if yes.contains(i) && !isNot.contains(i) {
            print(i, terminator: " ")
        }
    }
}

func eAutoNumber() {
    var witnesses = Array<String>()
    var suspects = Array<String>()
    var susSet: Set<Character>
    var witSet: Set<Character>
    var count: Int
    var maxCount = 0
    var susCount = Array<Int>()
    
    let m = Int(readLine() ?? "0")!
    for _ in 0..<m {
        witnesses.append(readLine()!)
    }
    let n = Int(readLine() ?? "0")!
    for _ in 0..<n {
        suspects.append(readLine()!)
    }
    
    for i in 0..<n {
        susSet = Set(suspects[i])
        count = m
        for wit in witnesses {
            witSet = Set(wit)
            for item in witSet {
                if !susSet.contains(item) {
                    count -= 1
                    break
                }
            }
        }
        if maxCount < count {
            maxCount = count
        }
        susCount.append(count)
    }
    
    for i in 0..<n {
        if susCount[i] == maxCount {
            print(suspects[i])
        }
    }
}
