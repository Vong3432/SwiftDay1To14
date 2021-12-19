// Day 8 – default values, throwing functions, and checkpoint 4

import Foundation
import Darwin

// default values for parameters
func printTimesTables(for number: Int, end: Int = 20) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

// functions error handling
enum PasswordError: LocalizedError {
    case short, obvious
    
    var errorDescription: String? {
        switch self {
            case .short:
                print("Too short")
                return "Too short"
            case .obvious:
                print("Too obvious")
                return "Too obvious"
        }
    }
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

do {
    let result = try checkPassword("12345")
    print("Rating for password: \(result)")
} catch let error as PasswordError {
    print("Have error: \(error)")
}

// checkpoint 4
/**
 The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

 1. You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 2. If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 3. You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 4. If you can’t find the square root, throw a “no root” error.
 
 As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X. So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.
 */

enum MySqrtError: LocalizedError {
    case outOfBounds, noRoot
    
    var errorDescription: String? {
        switch self {
            case .outOfBounds:
                return "Out of bounds"
            case .noRoot:
                return "No root"
        }
    }
}

func mySqrt(_ num: Int) throws -> Int {
    if num < 1 || num > 10000 {
        throw MySqrtError.outOfBounds
    }
    
    var root = 1
    var result  = 1
    
    while result < num {
        root += 1
        result = root * root
    }
    
    if result != num {
        throw MySqrtError.noRoot
    } else {
        return root
    }
    
}

do {
    let sqrtResult = try mySqrt(25)
    print("Result: \(sqrtResult)")
} catch let err as MySqrtError {
    print("Sqrt err: \(err)")
}


