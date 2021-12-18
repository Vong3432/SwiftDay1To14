// Day 2 - Booleans, string interpolation, and checkpoint 1

import Foundation

// booleans
let isMultiple = 120.isMultiple(of: 3)
var gameOver = false
gameOver.toggle()

// strings interpolation
let people = "john"
let action = "running"
let peopleAction = people + action

/**
 You already know enough to start writing your first useful code, albeit fairly simple: we’re going to convert temperatures from Celsius to Fahrenheit.

 Your goal is to write a Swift playground that:

 1. Creates a constant holding any temperature in Celsius.
 2. Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
 3. Prints the result for the user, showing both the Celsius and Fahrenheit values.
 */

let celsius = 20
let fahrenheit = ((celsius * 9) / 5) + 32
print("""
Celsius: \(celsius),
Fahrenheit: \(fahrenheit)°F
""")
