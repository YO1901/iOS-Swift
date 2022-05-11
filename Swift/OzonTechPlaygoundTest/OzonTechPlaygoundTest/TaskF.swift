//
//  TaskF.swift
//  OzonTechPlaygoundTest
//
//  Created by Yerlan Omarov on 08.05.2022.
//

import Foundation

/*
 
 enum Square: Character {
     case empty = "."
     case stone = "*"
     case water = "~"
 }
 let filler: [Character] = [".", "*", "~"]

 let collectionCount = Int(readLine() ?? "") ?? 0
 var array: [Int?]?
 var strArray: [String?]?

 var i = 0
 while i < collectionCount {
     var rowCount = 0
     var barCount = 0
     
     // input
     array = readLine()?.split(separator: Character(" ")).map(String.init).map(Int.init)
     if array != nil, array?.first != nil, array?.last != nil , array?.first! != nil, array?.last! != nil {
         rowCount = array![0]!
         barCount = array![1]!
     }
     var field = Array(repeating: Array(repeating: Square.empty.rawValue, count: rowCount), count: barCount)
     
     var j = 0
     while j < rowCount {
         let arr = Array(readLine() ?? "")
         var k = 0
         while k < barCount {
             field[k][j] = arr[k]
             k += 1
         }
         j += 1
     }
     
     // main operation
     // stones to the bottom
     let emptyArray = Array(repeating: Square.empty.rawValue, count: rowCount)
     var k = 0
     while k < barCount {
         var arr = field[k]
         var stoneCount = 0
         j = 0
         while j < rowCount {
             if arr[j] == Square.stone.rawValue {
                 stoneCount += 1
             }
             j += 1
         }
         arr = emptyArray
         j = rowCount - 1
         while j > rowCount - stoneCount - 1 {
             arr[j] = Square.stone.rawValue
             j -= 1
         }
         field[k] = arr
         
         k += 1
     }
     
     // fill in with the water
     j = rowCount - 1
     while j > -1 {
         var rightBorder = barCount
         var leftBorder = -1
         k = 0
         while k < barCount - 1 {
             guard rightBorder == barCount || leftBorder == -1 else {
                 break
             }
             if field[k][j] == Square.stone.rawValue, leftBorder == -1 {
                 leftBorder = k
             }
             if field[barCount - k - 1][j] == Square.stone.rawValue,
                barCount - k - 1 > leftBorder,
                rightBorder == barCount {
                 rightBorder = barCount - k - 1
             }
             k += 1
         }
         
         if leftBorder == -1 || rightBorder == barCount {
             j -= 1
             continue
         }
         k = leftBorder + 1
         while k < rightBorder, k > leftBorder {
             if field[k][j] == Square.empty.rawValue {
                 field[k][j] = Square.water.rawValue
             }
             k += 1
         }
         
         j -= 1
     }
     
     // output
     j = 0
     while j < rowCount {
         k = 0
         while k < barCount - 1 {
             print(field[k][j], terminator: "")
             k += 1
         }
         print(field[barCount - 1][j])
         j += 1
     }
     print()
     i += 1
 }

 
 */
