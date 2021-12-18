// Day 1 - Variables, constants, strings, and numbers

import Foundation

// variables
var greeting = "Hello"
greeting = "Hello world"

// constants
let character = "Dejavu"

// strings
let stringOuput = "Hello world 💻"
let multilineString = """
First paragraph
Second paragraph
Third paragraph
"""

stringOuput.count
stringOuput.uppercased()
stringOuput.hasPrefix("Hello")
stringOuput.hasSuffix("💻")

// numbers
let score = 10
let reallyBig = 1_00__00___00____00

120.isMultiple(of: 3)

let number = 0.1 + 0.2
print(number)

let a = 1
let b = 2.0
// let c = a + b (error)
let c = a + Int(b)
let d = Double(a) + b


