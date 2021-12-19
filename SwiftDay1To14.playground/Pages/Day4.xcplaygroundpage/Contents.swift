// Day 4 – type annotations and checkpoint 2

import Foundation

// type annotations
let surname: String = "John"
var score: Int = 0
var someDouble: Double = 2.3
var someSet: Set<String> = Set(["set1"])

// checkpoint 2
// This time the challenge is to create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.

let albums = ["Red", "Fearless", "Red"]
albums.count // 3

let uniqueAlbum: Set<String> = Set(albums)
uniqueAlbum.count // 2
