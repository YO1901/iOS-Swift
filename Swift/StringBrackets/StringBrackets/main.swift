//
//  main.swift
//  StringBrackets
//
//  Created by Yerlan Omarov on 25.05.2022.
//

import Foundation

public protocol Initializable {
    init()
}

public protocol StringBracketsValidating: Initializable {
/// Validates use of provided brackets within specified `String`
///
/// Brackets are considered to be used correctly if:
/// - For every opening bracket there is a closing bracket
/// - Every closing bracket is a closing counterpart to the last opened but unclosed bracket
///
/// - parameter brackets: Dictionary of expected brackets, where `Key` is an opening bracket
/// and `Value` is its closing counterpart.
/// - parameter string: String to validate.
/// - returns: Whether brackets in specified `String` are used correctly.
func validateBracketsUsedCorrectly(brackets: [Character: Character], in string: String) -> Bool
}

// Ниже напиши класс `StringBracketsValidator`, реализующий протокол `StringBracketsValidating`
class StringBracketsValidator: StringBracketsValidating {
    func validateBracketsUsedCorrectly(brackets: [Character : Character], in string: String) -> Bool {
        var open = [Character]()
        for item in string {
            if brackets[item] != nil {
                open.append(item)
            } else if brackets.values.contains(item) {
                guard let last = open.popLast(), item == brackets[last] else {
                    return false
                }
            }
        }
        return open.isEmpty
    }
    
    required init() {}
}


//  Проверка
let a = StringBracketsValidator()
let brackets: [Character: Character] = ["(": ")", "{": "}", "[": "]"]
let testStrings = ["(abc)", // true
                   "((({[]})))",  // true
                   "((({[]}))",  // false
                   "asdsa(daf]dvdv",  // false
                   "sff(ss)asfa[adaf]aaf{s{s}ad}"]  // true
for item in testStrings {
    print(a.validateBracketsUsedCorrectly(brackets: brackets, in: item))
}
