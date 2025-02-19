//
//  main.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/12/25.
//

import Foundation

print("Hello, World!");

loopControl(1, 5);

print("-------------------------");

let names: [String] = ["Felix", "Mike", "Ashley", "Amanda"];
halfRange(names);


print("-------------------------");

// going from index 2 and on so -> [2...]
print(oneSideRange(range: names));
// Ashley
// Amanda
print("-------------------------");
print(OneSide(range: names))
// ["Felix", "Mike", "Ashley"] -> [...2] -> going from beginning of the array to the 2nd index -> 0, 1, 2.
print("-------------------------");
let numberArrays: [Int] = [1, 33, 53, 2];
let doubleNum: [Double] = [22.3, 66.9, 55.2, 11.8, 19.4];
print(genericOneSided(doubleNum));
// [1, 33, 53] -> ["Felix", "Mike", "Ashley"]
// [22.3, 66.9, 55.2]
// due to generics, it works with all data types if needed
print("-------------------------");
print(dollarSign)
print(sparklingHeart); // unicode

print("-------------------------");
if emptyString.isEmpty {
    print("Nothing");
}

variableString += "and Carriage";
// Horse and Carriage

let constantString = "Highlander"
// constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified

print("-------------------------");
var chars: String = "Dog!🏆";
printChars(chars);
/*
 D
 o
 g
 !
 🏆
 */
print("-------------------------");

printChars(catString);
print("-------------------------");

print(stringConcat); // hello world

let mark: Character = "!";
stringConcat.append(mark);
print("-------------------------");
printChars(stringConcat);
