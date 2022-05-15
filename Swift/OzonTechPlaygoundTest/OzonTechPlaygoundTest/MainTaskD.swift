//
//  MainTaskD.swift
//  OzonTechPlaygoundTest
//
//  Created by Yerlan Omarov on 15.05.2022.
//

import Foundation
/*
 
 let collectionCount = Int(readLine() ?? "") ?? 0

 var array: [String]?
 var book = [String: [String]]()
 var unique = Set<String>()
 var person = [String]()
 var recordCount = 0
 var i = 0
 var j = 0
 var k = 0
 var size = 0
 var maxPrintCount = 0

 while i < collectionCount {
     recordCount = Int(readLine() ?? "") ?? 0
     
     j = 0
     book.removeAll()
     unique.removeAll()
     person.removeAll()
     while j < recordCount {
         array = readLine()?.split(separator: Character(" ")).map(String.init)
         if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil {
             book[array!.first!, default: [String]()].append(array!.last!)
         }
         unique.insert(array!.first!)
         j += 1
     }
     person = Array(unique).sorted()
     for key in person {
         unique = Set(book[key]!)
         print("\(key): \(min(unique.count, 5))", terminator: " ")
         unique.removeAll()
         k = 0
         maxPrintCount = 0
         size = book[key]!.count
         while k < size && maxPrintCount < 5 {
             let item = book[key]![size - k - 1]
             if unique.contains(item) {
                 k += 1
                 continue
             }
             unique.insert(item)
             print(item, terminator: " ")
             maxPrintCount += 1
             k += 1
         }
         print()
     }
     print()
     i += 1
 }

 
 */
