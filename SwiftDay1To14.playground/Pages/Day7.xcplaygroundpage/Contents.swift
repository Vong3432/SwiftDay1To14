// Day 7 - functions, parameters, and return values

import Foundation

func showWelcome() {
    print("Hello")
    print("World")
}

showWelcome()

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
            print("\(i) x \(number) is \(i * number)")
        }
}

printTimesTables(number: 5, end: 20)

// return value
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let rollDiceResult = rollDice()

// return multiple values
// return array
func getUser() -> [String] {
    ["John", "Doe"]
}

// return dict
func getUser2() -> [String: String] {
    [
        "firstName": "John",
        "lastName": "Doe"
    ]
}

// return tuple
func getUser3() -> (firstName: String, lastName: String) {
    (
        firstName: "John",
        lastName: "Doe"
    )
}

func getUser4() -> (String, String) {
    (
        "John",
        "Doe"
    )
}

getUser()
getUser2()["firstName"]

let user3 = getUser3()
let user3FirstName = user3.firstName
let user3LastName = user3.lastName
let (firstName: asdasd, _) = user3
print(asdasd) // "John"

let user4 = getUser4()
print("Name: \(user4.0) \(user4.1)") // access returned value with slice indices --> "Name: John Doe"


// customise parameters label

// unname
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)

// use external + internal
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
