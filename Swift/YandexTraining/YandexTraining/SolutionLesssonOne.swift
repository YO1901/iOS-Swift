//
//  SolutionLesssonOne.swift
//  YandexTraining
//
//  Created by Yerlan Omarov on 19.09.2021.
//

import Foundation

func aInteractor() {
    var r = 0
    var i = 0
    var c = 0
    var answer = 0
    
    r = Int(readLine() ?? "0")!
    i = Int(readLine() ?? "0")!
    c = Int(readLine() ?? "0")!
    
    switch (r, i, c) {
    case (_, 0, _):
        answer = r == 0 ? c : 3
    case (_, 1, _):
        answer = c
    case (_, 4, _):
        answer = r == 0 ? 4 : 3
    case (_, 6, _):
        answer = 0
    case (_, 7, _):
        answer = 1
    default:
        answer = i
    }
    
    print(answer)
}

func bMetroRingLine() {
    var n = 0
    var i = 0
    var j = 0
    var answer = 0
    
    let array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        n = array![0]!
        i = array![1]!
        j = array![2]!
    }
    
    answer = min(abs(i - j) - 1, n - abs(i - j) - 1)
 
    print(answer)
}

func cDates() {
    var x = 0
    var y = 0
    var z = 0
    var answer = 0
    
    let array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        x = array![0]!
        y = array![1]!
        z = array![2]!
    }
    
    if !(x < 13 && y < 13) || x == y {
        answer = 1
    }
    print(answer)
}

func dSchoolBuilding() {
    var answer = 0
    var houses = Array<Int>()
    
    let n = Int(readLine() ?? "0")!
    let array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        for i in 0..<n {
            houses.append(array![i]!)
        }
    }
    answer = houses[(n - 1) / 2]
    print(answer)
}

func ePointAndTriangle() {
        var answer = 0
        var x = 0
        var y = 0
        
        let d = Int(readLine() ?? "0")!
        let array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
        if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
            x = array![0]!
            y = array![1]!
        }
       
        if x >= 0 && y >= 0 && x + y <= d {
            answer = 0
        }
        else if Float(x) <= Float(d) / 2.0 && Float(y) <= Float(d) / 2 {
            answer = 1
        }
        else if x - y >= 0 {
            answer = 2
        }
        else if x - y < 0 {
            answer = 3
        }
        print(answer)
}
