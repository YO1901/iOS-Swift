//
//  main.swift
//  OzonTechPlaygoundTest
//
//  Created by Yerlan Omarov on 07.05.2022.
//

import Foundation

enum Sign: Character {
    case empty = "."
    case cross = "X"
    case zero = "0"
}

let collectionCount = Int(readLine() ?? "") ?? 0
var field = Array(repeating: Array(repeating: Sign.empty.rawValue, count: 3), count: 3)
var i = 0
var j = 0
var l = 0
var crossCount = 0
var zeroCount = 0
var placeHolder: String? = nil
var hasWinner = false

while i < collectionCount {
    i += 1
    placeHolder = readLine()
    crossCount = 0
    zeroCount = 0
    j = 0
    while j < 3 {
        var k = 0
        while k < 3 {
            /*vscanf(&field[k][j], <#T##CVaListPointer#>)
            if item == Sign.cross.rawValue {
                crossCount += 1
            } else if item == Sign.zero.rawValue {
                zeroCount += 1
            }*/
            k += 1
        }
        /*field[j] = Array(readLine() ?? "")
        for item in field[j] {
            if item == Sign.cross.rawValue {
                crossCount += 1
            } else if item == Sign.zero.rawValue {
                zeroCount += 1
            }
        }*/
        j += 1
    }
    guard crossCount - zeroCount < 2 && crossCount - zeroCount > -1 else {
        print("NO")
        continue
    }
    l = 0
    hasWinner = false
    while l < 3 {
        if (field[l][0] == field[l][1]  && field[l][1] == field[l][2] && field[l][0] != Sign.empty.rawValue) || (field[0][l] == field[1][l]  && field[1][l] == field[2][l] && field[0][l] != Sign.empty.rawValue) {
            hasWinner = true
            break
        }
        l += 1
    }
    if (field[0][0] == field[1][1]  && field[1][1] == field[2][2] && field[1][1] != Sign.empty.rawValue) || (field[0][2] == field[1][1]  && field[1][1] == field[2][0] && field[1][1] != Sign.empty.rawValue) {
        hasWinner = true
    }
    if hasWinner && crossCount - zeroCount == 0 {
        print("NO")
        continue
    }
    print("YES")
}
