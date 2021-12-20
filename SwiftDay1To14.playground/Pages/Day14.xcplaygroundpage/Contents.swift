// Day 14 - optionals, nil coalescing, and checkpoint 9

import Foundation

// optionals
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)") // will execute this
} else {
    print("Mario's opposite is nil")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.") // will execute this
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = 5
if let number = number {
    print(square(number: number))
}

// unwrap with guard

func printNum(num: Int?) {
    guard let number = num else {
        print("Missing num")
        return
    }
    print("printNum: \(number)")
}

printNum(num: 25)
printNum(num: nil)

// nil coalescing operator
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/a"
let altNew = captains["Serenity", default: "N/a"]

//  multiple optionals using optional chaining
struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    let isError = Bool.random()
    
    if isError {
        throw UserError.networkFailed
    } else {
        return "User\(id)"
    }
}

if let user = try? getUser(id: 5) {
    print("User: \(user)")
} else {
    print("err")
}

let user = (try? getUser(id: 5)) ?? "Anonymous"

// checkpoint 9
/**
 Your challenge is this: write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

 If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code. No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.
 */

func getRandElem(elems: [Int]?) -> Int {
    return elems?.randomElement() ?? Int.random(in: 0...100)
}

getRandElem(elems: [0,1])
getRandElem(elems: nil)
