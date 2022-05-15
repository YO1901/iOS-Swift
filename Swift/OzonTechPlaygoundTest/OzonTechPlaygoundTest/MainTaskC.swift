//
//  MainTaskC.swift
//  OzonTechPlaygoundTest
//
//  Created by Yerlan Omarov on 15.05.2022.
//

import Foundation

/*
 
 let collectionCount = Int(readLine() ?? "") ?? 0

 var array: [Int?]?
 var login = ""
 var history = Set<String>()
 var attemptsCount = 0
 var i = 0
 var j = 0
 var answer = "YES"

 while i < collectionCount {
     attemptsCount = Int(readLine() ?? "") ?? 0
     history.removeAll()
     j = 0
     while j < attemptsCount {
         login = readLine() ?? ""
         login = login.lowercased()
         answer = "YES"
         if login.count < 2 || login.count > 24 || login.first ?? "-" == "-" || history.contains(login) {
             answer = "NO"
             print(answer)
             j += 1
             continue
         }
         for char in login {
             let value = char.asciiValue ?? 0
             if value < 45 || (value > 45 && value < 48) ||
                 (value > 57 && value < 65) ||
             (value > 90 && value < 95) ||
             (value > 95 && value < 97) || value > 122 {
                 answer = "NO"
                 break
             }
         }
         history.insert(login)
         print(answer)
         j += 1
     }
     print()
     i += 1
 }

 
 */
