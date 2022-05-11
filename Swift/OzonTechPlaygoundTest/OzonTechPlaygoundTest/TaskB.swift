//
//  TaskB.swift
//  OzonTechPlaygoundTest
//
//  Created by Yerlan Omarov on 07.05.2022.
//

/*
import Foundation

 let collectionCount = Int(readLine() ?? "") ?? 0
 var i = 0

 while i < collectionCount {
     let taskCount  = Int(readLine() ?? "") ?? 0
     var input = Array(repeating: 0, count: taskCount)
     var dict = [Int: Int]()
     
     let array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
     if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil{
         var j = 0
         while j < taskCount {
             input[j] = array![j]!
             j += 1
         }
     }
     i += 1
     
     var priority = 1
     var sorted = input.sorted()
     
     while !sorted.isEmpty {
         let max = sorted.last ?? 0
         dict[max] = priority
         while true {
             guard let last = sorted.last, last == max else {
                 break
             }
             sorted.removeLast()
         }
         if let last = sorted.last, last == max - 1 {
             dict[max - 1] = priority
         }
         while true {
             guard let last = sorted.last, last == max - 1 else {
                 break
             }
             sorted.removeLast()
         }
         priority += 1
     }
     var k = 0
     while k < taskCount - 1 {
         print(dict[input[k]] ?? 0, terminator: " ")
         k += 1
     }
     print(dict[input[taskCount - 1]] ?? 0)
 }

*/
