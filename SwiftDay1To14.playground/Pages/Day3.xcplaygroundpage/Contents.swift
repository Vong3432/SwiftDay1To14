// Day 3 – Arrays, dictionaries, sets, and enums

import Foundation


/**
 Arrays start
 */
var numbers = [1,2,3,4,5]
var fruits = ["Apple", "Orange", "Pear"]
var temperatures = [26.3, 20.4]
var cars = ["BMW", "Porsche"]

numbers[0] // 1
fruits[1] // "Orange"

cars.append("Mclaren")
cars.append("Alfa Romeo")

// strong typed array
var albums = [String]() // [String]() == Array<String>()
albums.append("Red")
albums.count // 1

// remove
var characters = ["Lana", "Pam", "John"]
characters.remove(at: 1) // remove "Pam"
characters // ["Lana", "John]
characters.removeAll()
characters.count // 0

// contains
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
bondMovies.contains("Frozen") // false
bondMovies.contains("Time") // false
bondMovies.contains("No Time To Die") // true

// sorting
let cities = ["London", "Tokyo", "Rome", "Budapest"]
let sortedCities = cities.sorted() // ["Budapest", "London", "Rome", "Tokyo"]

// reversed
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed() // ["Biden", "Trump", "Obama", "Bush"]

/**
 Arrays end
 */

/**
 Dictionaries start
 */

let employee = [
    "name": "John Doe",
    "age": "19",
    "job": "IOS Developer"
]

employee["name"] // "John Doe"
employee["notindict"] // nil

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

// default value
olympics[2012, default: "Unknown"]

// multi typed
var response = [String: Any]()
response["code"] = 200
response["msg"] = "Message"

// strong typed
var heights = [String: Int]()
heights["JohnDoe"] = 170
heights["Steve"] = 175

// count
heights.count // 2
heights.removeAll()

/**
 Dictionaries end
 */

/**
 Set start
 */

let people = Set(["Daniel Ricciardo", "Sebastian", "Sebastian"]) // {"Sebastian", "Daniel Ricciardo"}

var people2 = Set<String>()
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")
people2 // different order {"Samuel L Jackson", "Tom Cruise", ...}

// sorting
people2.sorted() // {"Denzel Washington", "Nicolas Cage", ...}

// contain
people2.contains("Tom Cruise") // true

// count
people2.count // 4

// remove
people2.remove("Tom Cruise")
people2.removeAll()

/**
 Set end
 */

/**
 Enum start
 */

enum Weekday {
    case monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
}

var day = Weekday.monday
day = Weekday.friday
day = .tuesday

/**
 Enum end
 */
