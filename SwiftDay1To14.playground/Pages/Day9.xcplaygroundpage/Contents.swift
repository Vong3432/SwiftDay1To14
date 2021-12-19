// Day 9 - closures, passing functions into functions, and checkpoint 5

import Foundation

// closures
let sayHello = { (name: String) -> String in
    "Hi \(name)"
}

sayHello("John Doe")

// Given "Suzanne" is captain
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

/*
 (without closure)
 func captainFirstSorted(name1: String, name2: String) -> Bool {
     if name1 == "Suzanne" {
         return true
     } else if name2 == "Suzanne" {
         return false
     }

     return name1 < name2
 }
 let captainFirstTeam = team.sorted(by: captainFirstSorted)
*/

// (with closure)
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
captainFirstTeam

let betterCaptainFirstTeam = team.sorted(by: { (name1, name2) in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
betterCaptainFirstTeam

// trailing closure
let evenBetterCaptainFirstTeam = team.sorted { (name1, name2) in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let alternativeCaptainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}
alternativeCaptainFirstTeam

let reversedTeam = alternativeCaptainFirstTeam.sorted {
    return $0 > $1
}

let shorterReversedTeam = alternativeCaptainFirstTeam.sorted { $0 > $1 }
shorterReversedTeam

let tOnly = team.filter { $0.hasPrefix("T") }
tOnly

let uppercasedTeam = team.map { $0.uppercased() }
uppercasedTeam


// accept function as parameter
func doImportantWorks(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWorks {
    print("First work")
} second: {
    print("Second work")
} third: {
    print("Third work")
}

// checkpoint 5

/**
 You’ve already met sorted(), filter(), map(), so I’d like you to put them together in a chain – call one, then the other, then the other back to back without using temporary variables.

 Your input is this:

 let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
 
 Your job is to:
 1. Filter out any numbers that are even
 2. Sort the array in ascending order
 3. Map them to strings in the format “7 is a lucky number”
 4. Print the resulting array, one item per line
 
 So, your output should be as follows:

 7 is a lucky number
 15 is a lucky number
 21 is a lucky number
 31 is a lucky number
 33 is a lucky number
 49 is a lucky number
 */
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let output = luckyNumbers.filter { ($0 % 2) != 0 }
    .sorted { $0 < $1 }
    .map { "\($0) is a lucky number" }

for item in output {
 print(item)
}
