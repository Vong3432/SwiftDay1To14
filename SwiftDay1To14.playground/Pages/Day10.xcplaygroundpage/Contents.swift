// Day 10 - structs, computed properties, and property observers

import Foundation

// structs
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(year) \(title) by \(artist) ")
    }
}

let red = Album(title: "Red", artist: "John Doe", year: 2021)
red.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int = 14

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var emp1 = Employee(name: "John Doe", vacationRemaining: 10)
var emp2 = Employee(name: "Joseph")
emp1.takeVacation(days: 5)
emp1.vacationRemaining

emp2.takeVacation(days: 7)
emp2.vacationRemaining

// computed properties
struct Employee2 {
    let name: String
    var vacationAllocated: Int = 14
    var vacationTaken: Int = 0
    
    var vacationRemaining: Int {
        
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}
var emp3 = Employee2(name: "John Doe")
emp3.vacationTaken += 4
emp3.vacationRemaining = 5
emp3.vacationAllocated // 9


// property observers
struct Game {
    var score = 0 {
        willSet {
            print("Before set, score is \(score) and new value will be \(newValue)")
        }
        didSet {
            print("Score is now \(score), old value is \(oldValue)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

// custom initializers
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...10)
    }
}

var p1 = Player(name: "John Doe")
print("name: \(p1.name), number: \(p1.number)")
