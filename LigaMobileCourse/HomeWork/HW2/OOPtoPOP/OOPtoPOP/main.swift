//
//  main.swift
//  OOPtoPOP
//
//  Created by Yerlan Omarov on 23.02.2022.
//

import Foundation

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

