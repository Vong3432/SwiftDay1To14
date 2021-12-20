// Day 11 - access control, static properties and methods, and checkpoint 6

import Foundation

// access control (private)
// Use private for “don’t let anything outside the struct use this.”
// Use fileprivate for “don’t let anything outside the current file use this.”
// Use public for “let anyone, anywhere use this.”
struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// static
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

AppData.version
AppData.homeURL
AppData.saveFilename

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

print(Employee.example)


// checkpoint 6
/**
 create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
 */
struct Car {
    let model: String
    let numOfSeats: Int
    private(set) var currentGear: Int // readonly, but cannot be changed externally
    
    init(model: String, numOfSeats: Int) {
        self.model = model
        self.numOfSeats = numOfSeats
        self.currentGear = 1
    }
    
    mutating func changeGear(control: String) {
        if control == "up" {
            if currentGear < 6 {
                currentGear += 1
            } else {
                print("You are in Gear 6, cannot upshift.")
            }
        } else {
            if currentGear > 1 {
                currentGear -= 1
            } else {
                print("You are in Gear 1, cannot downshift.")
            }
        }
    }
}

var bmw = Car(model: "Bmw", numOfSeats: 4)
bmw.currentGear
// bmw.currentGear += 1 (will throw error)
bmw.changeGear(control: "up")
bmw.changeGear(control: "up")
bmw.changeGear(control: "up")
bmw.changeGear(control: "up")
bmw.changeGear(control: "up")
bmw.changeGear(control: "up")
bmw.changeGear(control: "down")

