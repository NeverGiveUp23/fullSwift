//
//  collections.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/19/25.
//

// Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collection of values

// ARRAYS
var someArray: [Int] = []; // empty array
var arrayCount: Int = someArray.count;


// Creating an array with default values
var threeDoubles = Array(repeating: 0.5, count: 4);

var shoppingList: [String] = ["Eggs", "Milk", "Cheese"];

// if you need its index and value, use the enumerated() method

func getValue(_ array: [String]) {
    for (index, value) in array.enumerated(){
        print("Item \(index + 1): \(value)");
    };
};

// SETS
// SETS do not have a shorthand form
var letters = Set<String>();

var favGenres: Set<String> = ["Name", "Rock"];
// due to type inference you dont need to put the data type, if youre going to initialize the values
var newGenres: Set = ["Hip hop", "RnB"];

// use intersection method to create a new set with only the values common to both sets
var oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// use the symmetricDifference method to create a new set with values in either set, but not both

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

// Dictionaries
var dictV: Dictionary<Int, String> = [1: "Bike", 2: "Wheel"];

// dictionary shorthang
var anotherDict: [Int: String] = [1: "Bike", 2: "Wheel"];
var airports: [String: String] = ["NYC": "Laguardia", "XYZ": "Toronto"];

// if you need to use the keys or values with an API that takes an array instance, initialize a new array
let airportCode = [String](airports.keys);
// airportCodes is ["LHR", "YYZ"]
let airportNames = [String](airports.values);
// airportNames is ["London Heathrow", "Toronto Pearson"]


