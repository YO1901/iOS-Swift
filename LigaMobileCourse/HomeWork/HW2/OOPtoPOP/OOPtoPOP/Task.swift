//
//  Task.swift
//  OOPtoPOP
//
//  Created by Yerlan Omarov on 23.02.2022.
//


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

