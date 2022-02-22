//
//  HW2.swift
//  LigaMobileCourse
//
//  Created by Yerlan Omarov on 21.02.2022.
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



// Задание OOP to POP

// Перед тем как делать, можно посмотреть вот это. Своеобразное введение в protocol oriented programming
// https://www.raywenderlich.com/6742901-protocol-oriented-programming-tutorial-in-swift-5-1-getting-started
// Но если любите по харду, то можете начать сами, а потом посмотреть.))


// Если вам будет лень придумывать героев, вот ссылка на их источник
//https://liquipedia.net/warcraft/Races

// Задание #1 (обязательно)
// Перепишите из OOP->POP
// Попробуйте использовать Trait/Mixin
// По желанию можно выполнить необязательные задания

// Совет:
// Предлагаю использовать ульту(способность) героев в виде Enum при проектировании
// enum AtackStyle: String {
//    case melee = "melee attak!"
//    case longRange = "long range attak!"
// }

// Задание №2 (необязательно)
// Добавьте Гильдию. Мы можем это использовать, чтобы ненужно было создавать отдельную структуру под Orc
// enum GuildType {
//    case aliance
//    case orc
//}

// Задание №3 (необязательно)
// Добавьте свой-во currentPosition: CGPoint. Теперь Героев можно передвигать и при этом у них будет меняться currentPosition. Дороботайте для этого функцию move()

// Задание №4 (необязательно)
// Добавьте возможность героям летать. func fly(to point: CGPoint)


// Далее Задание №5 (необязательно)
// Подходите к заданию творчески, используйте свой функционал, придумывайте его не надо стесняться)))
// 5.1 Создайте свои структуры со своими героями и положите их в массив.
// 5.2 Отсортируйте массивы с героями отделяя Орду от Альянса.
// 5.3 Отсортируйте по мощности атаки attackPower
// 5.4 Найдите самого сильного в массиве (attackPower) или того у кого больше всего mana

// Задание №6 (необязательно)
// Придумайте как можно использовать Dictionary для хранения героев
// Используйте пример из презы_)

/*
class Alliance {
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)

    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?

    init(statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }

    func attack() {
        print("attack")
    }

    func move() {
        print("move")
    }

    func stop() {
        print("stop")
    }

    func updateStatistics(_ statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }

    // Alliance functions
    func ultimate() {
    }

    func info() {
        print("\(String(describing: self))")
    }
}

class Archmage: Alliance {
    override func attack() {
        print("long-range attack")
    }

    override func ultimate() {
        super.ultimate()
        print("Avatar")
    }
}

class MountainKing: Alliance {
    override func attack() {
        print("melee attacks")
    }

    override func ultimate() {
        super.ultimate()
        print("Mass Teleport")
    }
}
*/
enum AtackStyle: String {
    case melee = "melee attak!"
    case longRange = "long range attak!"
}

protocol WarcraftRace {
    var race: String { get }
}

protocol WarcraftHero {
    func ultimate()
    func info()
}

protocol WarcraftAction {
    func attack()
    func move()
    func stop()
}

protocol LiveStatistics {
    var strength: Float? { get }
    var agility: Float? { get }
    var intelligence: Float? { get }
    var mana: Float? { get }
    
    func updateLiveStatistics(armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
}

protocol BaseStatistics {
    var armor: Float? { get }
    var attackPower: Float? { get }
    var hitPoints: Float? { get }
    
    func updateStatistics(armor: Float, attackPower: Float, hitPoints: Float)
}

class AllianceBuilding: WarcraftRace, BaseStatistics, WarcraftAction {
    typealias Statistics = (race: String, armor: Float, attackPower: Float, hitPoints: Float, mana: Float)
    typealias BaseStats = (armor: Float, attackPower: Float, hitPoints: Float, mana: Float)
    
    private(set) var race: String
    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var hitPoints: Float?
    
    init(statistics: Statistics) {
        self.race = statistics.race
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.hitPoints = statistics.hitPoints
    }

    func attack() {
        print("Alliance building cannot attack")
    }

    func move() {
        print("Alliance building cannot move")
    }

    func stop() {
        print("Stop forever")
    }

    func updateStatistics(armor: Float, attackPower: Float, hitPoints: Float) {
        self.armor = armor
        self.attackPower = attackPower
        self.hitPoints = hitPoints
    }
}

class AllianceUnit: WarcraftRace, BaseStatistics, LiveStatistics, WarcraftAction {
    typealias Statistics = (race: String, armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
    
    private(set) var race: String
    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?
    
    init(statistics: Statistics) {
        self.race = statistics.race
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }

    func attack() {
        print("attack")
    }

    func move() {
        print("move")
    }

    func stop() {
        print("stop")
    }

    func updateStatistics(armor: Float, attackPower: Float, hitPoints: Float) {
        self.armor = armor
        self.attackPower = attackPower
        self.hitPoints = hitPoints
    }
    
    func updateLiveStatistics(armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float) {
        self.strength = strength
        self.agility = agility
        self.intelligence = intelligence
        self.mana = mana
    }
}

class Archmage: AllianceUnit, WarcraftHero {
    override func attack() {
        print(AtackStyle.longRange)
    }

    func ultimate() {
        print("Avatar")
    }
    
    func info() {
        print("I'm mage")
    }
}
