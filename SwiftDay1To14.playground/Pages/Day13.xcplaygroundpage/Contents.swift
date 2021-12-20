// Day 13 - protocols, extensions, and checkpoint 8

import Foundation

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    
    let name = "Car"
    var currentPassengers = 5
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I am driving \(distance) km.")
    }
    
    func openSunRoof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    
    let name = "Bicycle"
    
    var currentPassengers = 2
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
let bike = Bicycle()

commute(distance: 10, using: car)
commute(distance: 10, using: bike)

getTravelEstimates(using: [car, bike], distance: 10)

// opaque return type with `some`
// although Int and Bool is comfort to Equatable protocol, but there are not interchangable ( Int != Bool )
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

// But the advantage here is that Swift always knows the real underlying data type. It’s a subtle distinction, but returning Vehicle means "any sort of Vehicle type but we don't know what", whereas returning some Vehicle means "a specific sort of Vehicle type but we don't want to say which one.”

// when you see some View in your SwiftUI code, it’s effectively us telling Swift “this is going to send back some kind of view to lay out, but I don’t want to write out the exact thing – you figure it out for yourself.
func getCar() -> some Vehicle {
    car
}

func getBike() -> some Vehicle {
    bike
}

getCar()
getBike()


// extensions

extension String {
    
    // return trimmed string
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // direct change string with trim
    mutating func trim() {
        self = self.trimmed()
    }
    
    // computed
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = "   The truth is rarely pure and never simple   "
let trimmedQuote = quote.trimmed()

quote // still "   The truth is rarely pure and never simple   "
quote.trim()
quote // becomes "The truth is rarely pure and never simple"

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

// a custom initializer, but also retain Swift’s automatic memberwise initializer
struct Book {
    // memberwise initializer
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    // but also remain custom init
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)


// protocol extensions

// eg To add .isNotEmpty()
// instead of using extension Array {}, use extension Collection {},
// because Array, Set, and Dictionary all conform to a built-in protocol called Collection,
extension Collection {
    var isNotEmpty: Bool {
        self.isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"] // array of string

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let emp1 = Employee(name: "Emp1")
emp1.sayHello()

// Int and Double comforts to Numeric
extension Numeric {
    
    // return current refer type
    // eg: 5.squared() -> Int
    // (2.5).squared() -> Double
    func squared() -> Self {
        self * self
    }
}

5.squared()
(2.5).squared()


// want to user built-in protocol Equatable to use == and !=
// to do this, need to make User struct comfort to Equatable

// We can go further: there’s a Swift protocol called Comparable, which allows Swift to see if one object should be sorted before another. Swift can’t automatically implement this in our custom types, but it’s not hard: you need to write a function called < that accepts two instances of your struct as its parameter, and returns true if the first instance should be sorted before the second.

// Behind the scenes, Swift uses protocol inheritance so that Comparable automatically also means Equatable. This works similarly to class inheritance, so when Comparable inherits from Equatable it also inherits all its requirements.
struct User: Comparable {
    let name: String
}

func <(lhs: User, rhs: User) -> Bool {
    lhs.name < rhs.name
}

let user1 = User(name: "Link")
let user2 = User(name: "Zelda")
print(user1 == user2)
print(user1 != user2)

let user3 = User(name: "Taylor")
let user4 = User(name: "Adele")
print(user3 < user4)
print(user3 <= user4)
print(user3 > user4)
print(user3 >= user4)

// checkpoint 8
/**
 Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

 1. A property storing how many rooms it has.
 2. A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
 3. A property storing the name of the estate agent responsible for selling the building.
 4. A method for printing the sales summary of the building, describing what it is along with its other properties.
 
 */

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var agent: String { get }
    
    func printSalesSummary() -> Void
}

struct House: Building {
    let rooms: Int
    let cost: Int
    let agent: String
    
    func printSalesSummary() {
        print("(House): Room of \(rooms) cost $\(cost) handle by agent \(agent)")
    }
}

struct Office: Building {
    let rooms: Int
    let cost: Int
    let agent: String
    
    func printSalesSummary() {
        print("(Office): Room of \(rooms) cost $\(cost) handle by agent \(agent)")
    }
}

let house = House(rooms: 5, cost: 1000, agent: "John Doe")
let office = Office(rooms: 30, cost: 10000, agent: "Joseph")

house.printSalesSummary()
office.printSalesSummary()

