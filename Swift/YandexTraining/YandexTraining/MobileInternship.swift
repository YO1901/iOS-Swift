//
//  MobileInternship.swift
//  YandexTraining
//
//  Created by Yerlan Omarov on 13.06.2022.
//

import Foundation

func internshipTaskA() {
    var s = 0
    var n = 0
    
    var array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        s = array!.first!!
        n = array!.last!!
    }
    
    var points = Array(repeating: 0, count: n)
    array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        var i = 0
        while i < n {
            points[i] = array![i]!
            i += 1
        }
    }
    points = points.sorted()
    var answer = 0
    if s > points.first! && s < points.last! && points.last! - s > s - points.first! {
        answer = points.last! - s + 2 * (s - points.first!)
    } else if s > points.first! && s < points.last! && points.last! - s <= s - points.first! {
        answer = 2 * (points.last! - s) + s - points.first!
    } else if s <= points.first! {
        answer = points.last! - s
    } else {
        answer = s - points.first!
    }
    print(answer)
}

func internshipTaskB() {
    let n = Int(readLine() ?? "") ?? 0
    var dogs = Array(repeating: 0, count: n)
    var collar = Array(repeating: 0, count: n)
    
    let array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        var i = 0
        while i < n {
            dogs[i] = array![i]!
            i += 1
        }
    }
    
    let array2 = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array2 != nil, array2?.first != nil, array2?.last != nil , array2?.first! != nil, array2?.last! != nil{
        var i = 0
        while i < n {
            collar[i] = array2![i]!
            i += 1
        }
    }
    
    var k = 0
    var house = 0
    var stress: Int?
    while k < n {
        var i = 0
        var j = 0
        var sum = 0
        while i < n {
            if collar[j] < dogs[(i + k) % n] {
                i += 1
                continue
            } else if collar[j] - dogs[(i + k) % n] < 101 {
                sum += (collar[j] - dogs[(i + k) % n]) / 2
            } else {
                sum += 30
            }
            j += 1
            i += 1
        }
        if (stress == nil) {
            stress = sum
            house = k + 1
        }
        if let unwrapped = stress, sum < unwrapped {
            stress = sum
            house = k + 1
        }
        k += 1
    }
    print(house, stress ?? 0)
}
