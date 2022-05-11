//
//  TaskE2.swift
//  OzonTechPlaygoundTest
//
//  Created by Yerlan Omarov on 08.05.2022.
//

import Foundation

/*
 
 let collectionCount = Int(readLine() ?? "0") ?? 0
 var i = 0
 while i < collectionCount {
     let _ = readLine()

     var input = Array(repeating: 0, count: 2)
     var flowCount = 0
     var taskCount = 0

     var array: [Int?]?
     //while array == nil || array!.isEmpty {
         array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
     //}
     if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil {
         flowCount = array![0]!
         taskCount = array![1]!
     }

     array = nil
     //while array == nil || array!.isEmpty {
         array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
     //}
     if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil {
         input = array!.map { $0! }
     }
     var flows = Array(repeating: 0, count: flowCount)
     var end = input[0] + input[1]
     var minIndex = 0

     flows[0] = end
     print(end, terminator: " ")
     var j = 1
     while j < taskCount {
         array = nil
         //while array == nil || array!.isEmpty {
             array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
         //}
         if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil {
             input = array!.map { $0! }
         }
         guard flowCount < taskCount else {
             end = input[0] + input[1]
             print(end, terminator: " ")
             j += 1
             continue
         }

         //(minIndex, end) = flows.enumerated().min(by: { $0.element < $1.element })!
         minIndex = 0
         var k = 1
         while k < flowCount {
             guard input[0] < flows[k] else {
                 minIndex = k
                 break
             }
             if flows[k] < flows[minIndex] {
                 minIndex = k
             }
             k += 1
         }
         end = flows[minIndex]
         if input[0] < end {
             end += input[1]
             flows[minIndex] = end
         } else {
             end = input[0] + input[1]
             flows[minIndex] = end
         }
         print(end, terminator: " ")
         j += 1
     }
     print()
     i += 1
 }

 
 */
