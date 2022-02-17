//
//  main.swift
//  LigaMobileCourse
//
//  Created by Yerlan Omarov on 15.02.2022.
//

import Foundation
// хотим добавить функциональности структуре
class Person: Equatable, Hashable {
    let name: String
    let lastname: String
    var age: Int
    let sex: Sex
    var weight: Double?
    var height: Double?
    var description: String {
        """
        "\(self)(name: \(self.name), \
        lastname: \(self.lastname), \
        age: \(self.age), \
        sex: \(self.sex), \
        weight: \(String(describing: self.weight)), \
        height: \(String(describing: self.height))
        """
    }
    
    init(name: String, lastname: String, age: Int, sex: Sex, weight: Double?, height: Double?) {
        self.name = name
        self.lastname = lastname
        self.age = age
        self.sex = sex
        self.weight = weight
        self.height = height
    }
    
    // для конформности протоколу Equatable
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name &&
                lhs.lastname == rhs.lastname &&
                lhs.age == rhs.age &&
                lhs.sex == rhs.sex
    }
    
    // для конформности протоколу Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.lastname)
        hasher.combine(self.age)
        hasher.combine(self.sex)
    }
}

enum Sex: String {
    case male = "male"
    case female = "female"
}

do {
    var queue = [Person]()
    queue.append(Person(name: "Adam", lastname: "Richy", age: 21, sex: .male, weight: 70.1, height: 180))
    queue.append(Person(name: "Eve", lastname: "Moss", age: 22, sex: .female, weight: 50.1, height: 165.2))
    queue.append(Person(name: "Adam", lastname: "Coch", age: 20, sex: .male, weight: 70.1, height: 175.2))
    queue.append(Person(name: "Ann", lastname: "Potter", age: 21, sex: .female, weight: 47.1, height: 158.1))
    queue.append(Person(name: "Adam", lastname: "Sandler", age: 21, sex: .male, weight: 70.1, height: 180))
    queue.append(Person(name: "Adam", lastname: "Richy", age: 21, sex: .male, weight: 70.1, height: 178))
    let adam  = Person(name: "Adam", lastname: "Easy", age: 23, sex: .male, weight: 70.1, height: 175.2)
    for person in queue {
        print(adam == person)
    }

    let unique_people = Set(queue)
    for person in unique_people {
        print(person.description)
    }
}
