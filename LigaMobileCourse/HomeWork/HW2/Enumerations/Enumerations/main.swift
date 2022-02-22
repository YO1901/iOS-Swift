//
//  main.swift
//  Enumerations
//
//  Created by Yerlan Omarov on 23.02.2022.
//

import Foundation

// Задание №1
// Написать код, где можно будет сравнивать перечисления.
// Где перечисления могут быть =>, >, <=, < исходя их rating и их названия самого перечисления

enum LessonType {
case math(rating: Int)
case nativeLanguage(rating: Int)
case computerSience(rating: Int)
case literature(rating: Int)
}

extension LessonType: Comparable {
static func == (_ lhs: LessonType, _ rhs: LessonType) -> Bool {
    switch (lhs, rhs) {
    case (.math(let a), .math(let b)),
        (.nativeLanguage(let a), .nativeLanguage(let b)),
        (.computerSience(let a), .computerSience(let b)),
        (.literature(let a), .literature(let b)):
        return a == b
    default:
        return false
    }
}

static func < (_ lhs: LessonType, _ rhs: LessonType) -> Bool {
    switch (lhs, rhs) {
    case (.math(let a), .math(let b)),
        (.nativeLanguage(let a), .nativeLanguage(let b)),
        (.computerSience(let a), .computerSience(let b)),
        (.literature(let a), .literature(let b)):
        return a < b
    default:
        return lhs == minimum(lhs, rhs)
    }
}

private static func minimum(_ lhs: Self, _ rhs: Self) -> Self  {
    switch (lhs, rhs) {
    case (.math, _):
        return lhs
    case (_, .math):
        return rhs
    case (.nativeLanguage, _):
        return lhs
    case (_, .nativeLanguage):
        return rhs
    case (.computerSience, _):
        return lhs
    case (_, .computerSience):
        return rhs
    case (.literature, _):
        return lhs
    case (_, .literature):
        return rhs
    }
}
}

var journal = [LessonType]()
journal.append(.literature(rating: 4))
journal.append(.literature(rating: 3))
journal.append(.literature(rating: 5))
journal.append(.nativeLanguage(rating: 1))
journal.append(.nativeLanguage(rating: 4))
journal.append(.nativeLanguage(rating: 3))
journal.append(.computerSience(rating: 5))
journal.append(.computerSience(rating: 4))
journal.append(.computerSience(rating: 3))
journal.append(.math(rating: 5))
journal.append(.math(rating: 4))
journal.append(.math(rating: 3))

print("Unsorted")
for item in journal {
print(item)
}
print()
print("Sorted by lesson and mark:")
for item in journal.sorted() {
print(item)
}

// Задание №2
// Реализуйте протокол Equitable у LessonType

// Уже реализовал в первом задании, т.к. Equatable требует определение оператора ==
