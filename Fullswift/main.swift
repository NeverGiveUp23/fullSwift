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
print("-------------------------");
print(greeting[greeting.startIndex]); // H
print("-------------------------");
print(greeting[greeting.index(before: greeting.endIndex)]) // o
print("-------------------------");

for index in greeting.indices {
    print("\(greeting[index]) ");
} // H e l l o
print("-------------------------");

welcome.insert("!", at: welcome.endIndex);
print(welcome);
print("-------------------------");
welcome.insert(contentsOf: " There", at: welcome.index(before: welcome.endIndex));
print(welcome);
// Hello There!
print("-------------------------");
welcome.remove(at: welcome.index(before: welcome.endIndex));
print(welcome); // Hello There
print("-------------------------");
scenes(romeoAndJuliet); // There are 5 scenes in Act 1
print("-------------------------");
endScene(romeoAndJuliet);
// 6 mansion scenes, and 2 cell scenes
print("-------------------------");
someArray.append(3);
print(someArray.count); // 1
print("-------------------------");
print(threeDoubles); // [0.5, 0.5, 0.5, 0.5]
print("-------------------------");
print(shoppingList.count);
shoppingList.append("Cereal");
print("-------------------------");

print(shoppingList.first!); // force unwrap to get element
print("-------------------------");

print(shoppingList.description);
shoppingList.insert("Pancakes", at: 0);// insert at index 0
print("-------------------------");

print(shoppingList.description);
shoppingList += ["Chocolate Spread", "Cheese", "Butter"];
print("-------------------------");

print(shoppingList.description);

for index in 0..<shoppingList.count {
    print(shoppingList[index]);
}
print("-------------------------");

print(shoppingList[2]);

shoppingList[4...6] = ["Shirt", "Apples"];
print(shoppingList[4...6]); // ["Shirt", "Apples", "Butter"]
print("-------------------------");
getValue(shoppingList);
/*
 Item 1: Pancakes
 Item 2: Eggs
 Item 3: Milk
 Item 4: Cheese
 Item 5: Shirt
 Item 6: Apples
 Item 7: Butter
 */


print("-------------------------");
print("-------------------------");

letters.insert("Name");

print("-------------------------");
// use intersection method to create a new set with only the values common to both sets
print(oddDigits.intersection(evenDigits).sorted())

print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()); // [1, 2, 9]

print(houseAnimals.isSubset(of: farmAnimals))// true
print(farmAnimals.isSuperset(of: houseAnimals))// true
print(farmAnimals.isDisjoint(with: cityAnimals))// true

print("-------------------------");
print(dictV.values)


print(anotherDict.keys.sorted())

for (key, value) in airports {
    print("\(key): \(value)");
}

airports["NJ"] = "New Jersey";

print("-------------------------");
for (key, value) in airports {
    print("\(key): \(value)");
}
// access the old value while updating to a new value
// updateValue returns an optional value of the dictionary

if let oldValue = airports.updateValue("XYZ airport", forKey: "XYZ") {
    print("The old value in airport was \(oldValue)");
};

print("-------------------------");
for (key, value) in airports {
    print("\(key): \(value)");
}
/*
 NYC: Laguardia
 XYZ: XYZ airport -> changed
 NJ: New Jersey
 */
print("-------------------------");
if let removedValue = airports.removeValue(forKey: "xyz".uppercased()) {
    print("The removed value is \(removedValue)")
} else {
    print("No value option");
}; // The removed value is XYZ airport
print("-------------------------");
responseMessages[301] = "Moved Permanently"
for code in httpResponseCodes {
    if let message = responseMessages[code] {
        print("Response \(code): \(message)")
    }
}
/*
 Response 200: OK
 Response 403: Access forbidden
 Response 301: Moved Permanently
 */

print("-------------------------");
for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: >) // sorts in descending order
};

print(sortDict(interestingNumbers));

