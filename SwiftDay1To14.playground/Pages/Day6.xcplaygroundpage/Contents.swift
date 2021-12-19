// Day 6 – loops, summary, and checkpoint 3

import Foundation

// looping

// loop array
let platforms = ["MacOS", "Linux", "iOS"]

for os in platforms {
    print(os)
}

// loop with range
for i in 1...12 {
    print(i) // will print 1,2,3,4,... until 12
}

for i in 1..<5 {
    print(i) // will print 1,2,3,4
}

var lyris = "Troll"

for _ in 1...5 {
    lyris += " troll"
}

print(lyris)


// while loops
var countdown = 10

while countdown > 0 {
    print("countdown: \(countdown)")
    countdown -= 1
}

let id = Int.random(in: 0...4)
let amount = Double.random(in: 0...1)

// skip loops with continue and break
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for file in filenames {
    if !file.hasSuffix(".jpg") {
        continue // jump to next iteration
    }
    print("Found picture: \(file)")
}

for file in filenames {
    if file.hasSuffix(".jpg") {
        print("Found first picture: \(file)")
        break
    }
    print("Will not print")
}

// checkpoint 3
/**
 
 The problem is called fizz buzz, and has been used in job interviews, university entrance tests, and more for as long as I can remember. Your goal is to loop from 1 through 100, and for each number:

 If it’s a multiple of 3, print “Fizz”
 If it’s a multiple of 5, print “Buzz”
 If it’s a multiple of 3 and 5, print “FizzBuzz”
 Otherwise, just print the number.
 So, here are some example values you should have when your code runs:

 1 should print “1”
 2 should print “2”
 3 should print “Fizz”
 4 should print “4”
 5 should print “Buzz”
 6 should print “Fizz”
 7 should print “7”
 …
 15 should print “FizzBuzz”
 …
 100 should print “Buzz”
 
 */

for i in 1...100 {
    
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
