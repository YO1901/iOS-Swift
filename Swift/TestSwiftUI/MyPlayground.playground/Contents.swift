////struct A: Comparable {
////    let a: String
////
////    static func < (lhs: A, rhs: A) -> Bool {
////        lhs.a < rhs.a
////    }
////}
////
////struct C {
////    let c: String
////
////    struct B: Comparable {
////        let b: String
////
////        static func <(lhs: Self, rhs: Self) -> Bool {
////            lhs.b < rhs.b
////        }
////    }
////}
////
////let a = C.B(b: "A")
////let b = C.B(b: "B")
////print(a < b)
////
////func test() {
////    let c: String
////
////    class B: Comparable {
////        let b: String
////
////        static func <(lhs: B, rhs: B) -> Bool {
////            lhs.b < rhs.b
////        }
////    }
////}
//
//var closure0: () -> Void  = {}
//var closure1: () -> Void  = {}
//var closure2: () -> Void  = {}
//
//class MyClass {
//    var int = 5
//
//    func foo(_ closure: @escaping () -> Void) {
//        closure0 = { [unowned self] in
//            closure1 = {
//                closure2 = {
//                    self.int += 1
//                    closure()
//                }
//            }
//
//        }
//    }
//
//    deinit{
//        print("deinited")
//    }
//}
//
//do {
//    let myClass = MyClass()
//    myClass.foo {
//        print("foo")
//    }
//
//    closure0()
//    closure1()
//    closure2()
//}
//
//closure0()
//closure1()
//closure2()
//

import Foundation

//class C: NSObject {
//    override init() {
//        super.init()
//        print("C init")
//    }
//    deinit {
//        print("C deinit")
//    }
//
//    func foo() {
//        bar(self, #selector(baz))
//    }
//
//    @objc func baz() {
//        print("baz!")
//    }
//}
//
//func bar( object: NSObject,  selector: Selector) {
//    weak var object = object
//    //let object: NSObject? = object
//
//    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
//        object?.perform(selector, with: nil)
//    }
//}

//struct S: Equatable, Hashable {
//    let x: Int
//    static func == (a: Self, b: Self) -> Bool {
//        print(a, b)
//        // a custom type that treats negative values equal positives.
////        let x = a.x < 0 ? -a.x : a.x
////        let y = b.x < 0 ? -b.x : b.x
////        return x == y
//        return abs(a.x) == abs(b.x)
//    }
//
//}
//
//let a = S(x: Int.max)
//let c = S(x: Int.max)
//let b = S(x: Int.min + 1)
//
//print(a == b)
//print(a.hashValue == b.hashValue, a.hashValue, b.hashValue)
//print(a.hashValue == c.hashValue, a.hashValue, c.hashValue)


//final class BankAccount {
//
//    let id: String
//    var amount: Int
//    var isFrozen: Bool
//
//    init(id: String, amount: Int, isFrozen: Bool) {
//        self.id = id
//        self.amount = amount
//        self.isFrozen = isFrozen
//    }
//}
//
//func transfer(from: BankAccount, to: BankAccount, amount: Int) {
//   from.amount -= amount
//   to.amount += amount
//}
//
//extension BankAccount: Hashable {
//    static func == (lhs: BankAccount, rhs: BankAccount) -> Bool {
//        lhs.id == rhs.id
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//}
//
//var set = Set<BankAccount>()
//set.insert(BankAccount(id: "1", amount: 1, isFrozen: false))
//print(set)
//
//var closure: (() -> Void)?
//
//func doSomething() {
//  var v = 5
//  closure = {
//    print(v)
//  }
//  v = 10
//}
//
//doSomething()
//closure?()
//
//////////////////////////////////////////
////
//protocol MyProtocol {
//    func extensionMethod()
//}
//
//struct MyStruct: MyProtocol {}
//
//extension MyStruct {
//    func extensionMethod() {
//        print("In Struct")
//    }
//}
//
//extension MyProtocol {
//    func extensionMethod() {
//        print("In Protocol")
//    }
//}
//
//let myStruct = MyStruct()
//let myProtocol: MyProtocol = myStruct
//
//myStruct.extensionMethod()      // In struct
//myProtocol.extensionMethod()    // In Protocol

//struct Test: LosslessStringConvertible {
//    var description: String {
//        string
//    }
//    private var string: String
//
//    init?(_ description: String) {
//        self.string = description
//    }
//}
//
//var a: Test = "Hello"
//var b: String = "world"
//print(a, b)
//a += " " + b
//print(a)

//import UIKit
//let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
//let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
//NSLayoutConstraint.activate([
//    imageView.heightAnchor.constraint(eq: <#T##NSLayoutDimension#>, multiplier: <#T##CGFloat#>: view.widthAnchor, multiplier: 1)
//])
//
//
//class Player {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct PlayerQueue {
//    var players: [Player]
//
//    init(players: [Player]) {
//        self.players = players
//    }
//}
//
//extension Array where Element == Player {
//    var allPlayersName: String {
//        return reduce("", { "\($0) \($1.name )" })
//    }
//}

//let queue = PlayerQueue(players: [
//    Player(name: "A"),
//    Player(name: "B"),
//    Player(name: "C")
//])
//
//var copy = queue
//let _ = (copy.players.removeLast(), queue.players[2].name = "D")
//print(queue.players.allPlayersName)
//print(copy.players.allPlayersName)

//var global = 0
//
//func exampleFunc(_ n: inout Int) {
//    print("before increment \(global) \(n)")
//    n += 1
//    print("after increment \(global) \(n)")
//}
//
//exampleFunc(&global)
//print("after func \(global)")


//let a = "1"
//let b = "\u{221E}"
//print(Double(a))
//print(b)
//print(Double(b))
//import UIKit
//
//class A: UIViewController {
//    weak var workItem: DispatchWorkItem?
//
//    func test() {
//        let workItem = DispatchWorkItem {
//            self.view.backgroundColor = .red
//            print(self.workItem)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: workItem)
//
//        self.workItem = workItem
//    }
//}
//
//class B {
//    var a: A? = A()
//    var b: A?
//    func gg() {
//        let a = A()
//        self.b = a
//        a.test()
//        self.a = nil
//        print(self.a)
//        print(self.b)
//    }
//}
//
//let b = B()
//b.gg()
//DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
//    print(b.b)
//}
//


// start 1:
enum Gender {
    case male, female
}
struct Person {
    let name: String
    let surname: String
    let age: Int
    let gender: Gender
}
let list: [Person] = [
    .init(name: "Paul", surname: "Brown", age: 23, gender: .male),
    .init(name: "John", surname: "Williams", age: 5, gender: .male),
    .init(name: "Donna", surname: "Anderson", age: 62, gender: .male),
    .init(name: "Jessica", surname: "Richards", age: 17, gender: .male),
    .init(name: "Martin", surname: "Scott", age: 33, gender: .male),
    .init(name: "Scott", surname: "Martin", age: 33, gender: .female),
    .init(name: "Eva", surname: "Peters", age: 17, gender: .female),
    .init(name: "Emily", surname: "Gibson", age: 11, gender: .female),
    .init(name: "Mia", surname: "Jordan", age: 97, gender: .female),
    .init(name: "Sofia", surname: "Grant", age: 8, gender: .female),
    .init(name: "Olivia", surname: "Davis", age: 52, gender: .female),
    .init(name: "Mia", surname: "Jones", age: 83, gender: .female),
    .init(name: "Olivia", surname: "Davis", age: 24, gender: .female),
]

extension Person: Hashable {
//    func hash(into hasher: inout Hasher) {
//        let combined = name.hashValue ^ surname.hashValue
//        hasher.combine(combined)
//    }
    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(surname)
//    }
//
//    good
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(age)
//        hasher.combine(gender)
//    }
    
//    func hash(into hasher: inout Hasher) {
//        let combined = name.unicodeScalars.map { Int($0.value) }.reduce(0, +) + age
//        hasher.combine(combined)
//    }
//    good
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name.count)
//        hasher.combine(surname.count)
//        hasher.combine(age)
//    }

}

//for item in list {
//    print(item.hashValue)
//}

// end 1

// start 25.08.2023
//func task() async {
//    print("1")
//    async let _ = childTask()
//    print("2")
//}
//
//func childTask() async {
//    do {
//        try await Task.sleep(nanoseconds: 1 * NSEC_PER_SEC)
//        print("3")
//    } catch {
//        print("4")
//    }
//}
//
//Task {
//    await task()
//}

// end 25.08.2023


// start 04.03.2023

//func ms(_ string: String?) -> String {
//    guard var string = string else { return "hoo"}
//
//    string = "Modified \(string)"
//    return string
//}
//
//var string: String? = "String"
//let result = ms(string)
//print(result)

//
//var string = ""
//let letter = string.first!

//

//var a = 1
//var b = 2
//print(a === b)

//
//class AwesomeClass {
//    var value = 0
//}
//
//let object = AwesomeClass()
//var arrayOne = [object, object, object]
//var arrayTwo = arrayOne
//arrayOne.first?.value = 1
//
//print(arrayTwo.map { $0.value })
//
//class MemoryLeakTest {
//    var value: Int!
//
//    func action() {
//        DispatchQueue.main.async {
//            self.value = 1
//            print("closure performed")
//        }
//        print("action performed")
//    }
//
//    deinit {
//        print("MemoryLeakTest deinited")
//    }
//}
//
//let a = MemoryLeakTest()
//a.action()
//
//class ExtensionTest {
//    func action() {
//
//    }
//}
//
//extension ExtensionTest {
//    func secondaryAction() {
//
//    }
//}
//
//class ExtensionTestChild: ExtensionTest {
//    override func action() {
//
//    }
//
//    override func secondaryAction() {
//        <#code#>
//    }
//}
//

//protocol CustomProtocol {
//    func protocolMethodWithDefault()
//}
//
//extension CustomProtocol {
//    func protocolMethodWithDefault() { print("CustomProtocol default method") }
//}
//
//struct CustomStruct: CustomProtocol {
//    func protocolMethodWithDefault() { print("CustomStruct + protocol with default") }
//}
//
//let value: CustomProtocol = CustomStruct()
//value.protocolMethodWithDefault()
//
//protocol CustomProtocol {
//}
//
//extension CustomProtocol {
//    func protocolMethodWithDefault() { print("CustomProtocol default method") }
//}
//
//struct CustomStruct: CustomProtocol {
//    func protocolMethodWithDefault() { print("CustomStruct + protocol with default") }
//}
//
//let value: CustomProtocol = CustomStruct()
//value.protocolMethodWithDefault()
//


// MARK: GENERICS
//1.
//struct Container<T: AnyObject> {
//    weak var value: T?
//}
//
//2.
//some - тип будет определен на этапе компиляции
//any - превращает типы в Any, тип будет определен в рантайме
//
//3.
//extension Array where Element == String {
//   func counts() -> [Int] {
//       self.map { $0.count }
//   }
//}
//
//4.
//func add(_ lhs: Addable, _ rhs: Addable) {}
//
//func add<T: Addable>(_ lhs: T, _ rhs: T) {}
//
//Первый метод будет работать только если указать ключевое слово any или some. В обоих случаях разница методов заключается в том, что первый метод будет работать со все типами T удовлетворяющим протоколу Addable, даже если типы будут отличаться. Второй же метод будет работать в контексте одного типа T. Чтобы методы вели себя одинаково нужно добавить второй generic тип, удовлетворяющий протоколу Addable
//случай any:
//func add(_ lhs: any Addable, _ rhs: any Addable) {}
//func add<T: Addable, S: Addable>(_ lhs: T, _ rhs: S) where T: Any, S: Any {}
//случай some:
//func add(_ lhs: some Addable, _ rhs: some Addable) {}
//func add<T: Addable, S: Addable>(_ lhs: T, _ rhs: S) {}

// map
//extension Array {
//    func customMap<T>(_ transform: (Element) -> T) -> [T] {
//        var result = [T]()
//        for item in self {
//            result.append(transform(item))
//        }
//        return result
//    }
//}
//
//// filter
//extension Array {
//    func customFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
//        var result = [Element]()
//        for item in self {
//            guard isIncluded(item) else { continue }
//            result.append(item)
//        }
//        return result
//    }
//}


//let a = ["a", "b"]
//let b = ["c"]


