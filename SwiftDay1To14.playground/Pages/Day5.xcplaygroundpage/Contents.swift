// Day 5 – if, switch, and the ternary operator

import Foundation

let score = 85

if score > 80 {
    print("A")
}

let name: String = "John Doe"

if name != "Guest" {
    print("Welcome \(name)")
}

// check empty (not recommend)
// Given name holds a very large string, Swift will check one by one (letter) to get the `count`, unlike `isEmpty` that will return true directly if that string is empty.
if name.count == 0 {
    print("Empty")
}
// check empty (recommend)
if name.isEmpty {
    print("Empty")
}

// multiple conditions
let userAge = 14
let canPlayGame = true

if userAge >= 18 || canPlayGame {
    print("Play game")
}

// if-else with Enum
enum TransportOption {
    case airplane, heli, bike, car
}

let transport: TransportOption = .airplane

if transport == .airplane || transport == .heli {
    print("Let's fly")
} else if transport == .bike {
    print("Biking")
} else {
    print("Let's go vroom vroom")
}


// switch
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast: Weather = .sun

switch forecast {
    case .sun:
        print("sun")
    case .rain:
        print("Rainny day")
    case .wind:
        print("Windy")
    case .snow:
        print("Snowing")
    case .unknown:
        print("wth?")
    default:
        print("cannot catch")
}

// fallthrough - Execute next case like other languages such as js, since swift will stop execute once a case is matched, not like js we have to put "break;"
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// ternary operator
let age = 18
let canVote = age >= 18 ? "Yes" : "No"

enum Theme {
    case light, dark
}

let theme = Theme.dark
let bg = theme == .dark ? "Dark" : "Light"
