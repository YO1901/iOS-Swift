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


final class BankAccount {
    
    let id: String
    var amount: Int
    var isFrozen: Bool
    
    init(id: String, amount: Int, isFrozen: Bool) {
        self.id = id
        self.amount = amount
        self.isFrozen = isFrozen
    }
}

func transfer(from: BankAccount, to: BankAccount, amount: Int) {
   from.amount -= amount
   to.amount += amount
}

extension BankAccount: Hashable {
    static func == (lhs: BankAccount, rhs: BankAccount) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

var set = Set<BankAccount>()
set.insert(BankAccount(id: "1", amount: 1, isFrozen: false))
print(set)
