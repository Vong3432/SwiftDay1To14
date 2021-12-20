// Day 12 - classes, inheritance, and checkpoint 7

import Foundation

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// inheritance
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("Working for \(hours) hours")
    }
    
    override func printSummary() {
        print("I work \(hours) hours a day, but sometimes not")
    }
}

class Manager: Employee {
    func work() {
        print("Working for \(hours) hours")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
robert.printSummary()
joseph.work()
joseph.printSummary()


// initializers
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

class Human {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

// will inherit parent's init if subclass dont have its own initializers
class Monster: Human {
    let hands: Int = 10
}

let monsterY = Monster(legs: 10)
monsterY.legs // 10
monsterY.hands // 10


// copy classes
class User {
    var username = "Anonymous"
    
    func uniqueCopy() -> User {
        let user = User()
        user.username = username
        return user
    }
}
var user1 = User()
var user2 = user1
var user3 = user1.uniqueCopy()

user1.username = "wewe"
user2.username = "Taylor"

user1.username
user2.username
user3.username

// deinit
class DeInitUser {
    let id: Int

    init(id: Int) {
        self.id = id
        print("DeInitUser \(id): I'm alive!")
    }

    deinit {
        print("DeInitUser \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = DeInitUser(id: i)
    print("DeInitUser \(user.id): I'm in control!")
}

var users = [DeInitUser]()

for i in 4...6 {
    let user = DeInitUser(id: i)
    print("DeInitUser \(user.id): I'm in control!")
    users.append(user)
}
print("Loop is finished!")
users.removeAll()
print("Array is clear!")


// checkpoint 7
/**
 Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

 But there’s more:

 1. The Animal class should have a legs integer property that tracks how many legs the animal has.
 2. The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
 3. The Cat class should have a matching speak() method, again with each subclass printing something different.
 4. The Cat class should have an isTame Boolean property, provided using an initializer.
 */
class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("woof woof \(legs)")
    }
}

class Corgi: Dog {
    override func speak() {
        print("woof corgi \(legs)")
    }
}

class Poodle: Dog {
    override func speak() {
        print("woof poodle \(legs)")
    }
}

class Cat: Animal {
    
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("meow meow \(legs) \(isTame)")
    }
}

class Persian: Cat {
    override func speak() {
        print("meow Persian \(legs) \(isTame)")
    }
}

class Lion: Cat {
    override func speak() {
        print("meow lion \(legs) \(isTame)")
    }
}

let poodle = Poodle(legs: 4)
poodle.speak()
let lion = Lion(legs: 4, isTame: true)
lion.speak()
