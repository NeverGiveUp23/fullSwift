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
var newGenres: Set = ["Hip hop", "RnB", "RnB"];

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

var responseMessages: [Int: String] = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]

let httpResponseCodes: [Int] = [200, 403, 301];

var interestingNumbers = ["primes": [2, 3, 5, 7, 11, 13, 17],
                          "triangular": [1, 3, 6, 10, 15, 21, 28],
                          "hexagonal": [1, 6, 15, 28, 45, 66, 91]]


func sortDict(_ dict: [String: [Int]]) -> [Int] {
    var descArray: [Int] = [];
    for key in dict.keys {
        descArray.append(contentsOf: dict[key]!.sorted(by: >))  // sorts in descending order
        
    };
    return descArray;
}
// a function that returns an array of ints from a dictionry with keys as Strings and its values as Int, -> returning those int values from each key in descending order
func sortingDict(_ dict: [String: [Int]]) -> [Int] {
    var descArray: [Int] = [];

    for key in dict.keys {
        descArray.append(contentsOf: dict[key]!.sorted(by: >));
    }
    
    return descArray;
}
