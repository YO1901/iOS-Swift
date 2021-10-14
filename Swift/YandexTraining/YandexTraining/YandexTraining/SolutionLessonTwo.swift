//
//  SolutionLessonTwo.swift
//  YandexTraining
//
//  Created by Yerlan Omarov on 08.10.2021.
//

import Foundation

func aMaxEqualCount() {
    var n = Int(readLine() ?? "0")!
    var max = n
    var count = 0
    
    while n != 0 {
        if max == n {
            count += 1
        }
        else if max < n {
            count = 1
            max = n
        }
        n = Int(readLine() ?? "0")!
    }
    print(count)
}

func bHousesAndStores() {
    let n = 10
    var s = -1
    var maxDistance = 0
    var numbers = Array<Int>()
    var left = Array<Int>(repeating: 0, count: n)
    var right = Array<Int>(repeating: 0, count: n)

    let array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        for i in 0..<n {
            numbers.append(array![i]!)
        }
    }
    
    for i in 0..<n {
        if numbers[i] == 1 && s > -1 {
            left[i] = i - s
        }
        else if numbers[i] == 2 {
            s = i
        }
    }
    s = -1
    for i in stride(from: n - 1, through: 0, by: -1) {
        if numbers[i] == 1 && s > -1 {
            right[i] = s - i
        }
        else if numbers[i] == 2 {
            s = i
        }
    }
    for i in 0..<n {
        if left[i] * right[i] == 0 && maxDistance < max(left[i], right[i]) {
            maxDistance = max(left[i], right[i])
        }
        else if maxDistance < min(left[i], right[i]) {
            maxDistance = min(left[i], right[i])
        }
    }
    print(maxDistance)
}

func cMakingPalindrom() {
    let input = readLine() ?? ""
    let n = input.count
    var answer = 0
    var i = input.startIndex
    var k = input.startIndex
    
    for j in 0..<n / 2 {
        i = input.index(input.startIndex, offsetBy: j)
        k = input.index(input.endIndex, offsetBy: -j - 1)
        if input[i] != input[k] {
            answer += 1
        }
    }
    
    print(answer)
}

func dAtriumBenches() {
    var l = 0
    var k = 0
    var legs = Array<Int>()
        
    var array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        l = array![0]!
        k = array![1]!
    }
        
    array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        for i in 0..<k {
            legs.append(array![i]!)
        }
    }
        
    for i in 1..<k {
        if legs[i - 1] < (l + 1) / 2 && legs[i] > l/2 {
            print(legs[i - 1], legs[i])
            return
        }
        else if legs[i] == l / 2 {
            print(legs[i])
            return
        }
        else if legs[i - 1] == l / 2 {
            print(legs[i - 1])
            return
        }
    }
}

func eDiplomasInFolders() {
    let n = Int(readLine() ?? "0")!
    var sum = 0
    var max = 0
    
    let array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
    if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
        max = array![0]!
        sum = max
        for i in 1..<n {
            sum += array![i]!
            if max < array![i]! {
                max = array![i]!
            }
        }
    }
    print(sum - max)
}
