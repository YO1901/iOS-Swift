//
//  MainTaskB.swift
//  OzonTechPlaygoundTest
//
//  Created by Yerlan Omarov on 15.05.2022.
//

import Foundation

/*
 
 
 let collectionCount = Int(readLine() ?? "") ?? 0

 var array: [Int?]?
 var table: [[Int]]
 var rowCount = 0
 var barCount = 0
 var i = 0
 var j = 0
 var clickCount  = 0
 var clicks: [Int]
 var placeholder: String?

 while i < collectionCount {
     placeholder = readLine()
     
     array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
     if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil {
         rowCount = array!.first!!
         barCount = array!.last!!
     }
     table = Array(repeating: Array(repeating: 0, count: barCount), count: rowCount)
     j = 0
     while j < rowCount {
         array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
         if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil {
             table[j] = array!.map { $0! }
         }
         j += 1
     }
     
     clickCount = Int(readLine() ?? "") ?? 0
     clicks = Array(repeating: 0, count: clickCount)
     j = 0
     array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
     if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil {
         clicks = array!.map { $0! - 1 }
     }
     for item in clicks {
         table = table.sorted { x, y in
             x[item] < y[item]
         }
         
     }
     for row in table {
         j = 0
         while j < barCount {
             print(row[j], terminator: " ")
             j += 1
         }
         print()
     }
     print()
     i += 1
 }
 
 */
