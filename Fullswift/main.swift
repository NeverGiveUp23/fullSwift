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

for tickmark in 0..<minutes {
    print(tickmark);
}

// Some users might want fewer tick marks in their UI. They could prefer one mark every 5 minutes instead. Use the stride(from:to:by:) function to skip the unwanted marks.
var minutes = 60;
var minuteInterval = 5;

for tickmark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickmark);
}

print("-------------------------");
print(greet(person: "Felix"));

print(alreadyGreeted(person: "Felix", alreadyGreeted: true))

print("-------------------------");
printWithoutCounting(string: "Hello, World");

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min), and max is \(bounds.max)");
}

print(anotherGreet(person: "Felix", from: "Bronx"));

print(vaidaic(1,2,3,4,5))

var someInt = 99;
var anotherInt = 44;
swapTwoInts(&someInt, &anotherInt);
print(someInt, anotherInt);


// using function types
// You use function types just like any other types in Swift. For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable:
var mathFunction: (Int, Int) -> Int = addInts;
print(mathFunction(4, 5)); // returns 9;
mathFunction = multiplyInts;
print(mathFunction(66, 3)); // returns 198

printMathFunction(addInts, 44, 99); // return 143

print(chooseStepFunction(backword: true));



// CLOSURES

var reversedNames = newNames.sorted(by: backward);
print(reversedNames);

greet(); // -> Closure call

print("----------------------");
print(add(5,2));

print(addAnother(7,9));

print(doubled) // Output: [2, 4, 6, 8, 10]

print("----------------------");
print(indexedDouble)

print("---------------------");
print(incrementByTwo());

print(reveresedNames)

print(incrementByTen());
print(incrementByTen());
print(incrementByTen());
print(incrementByTen());
//10
//20
//30
//40


instance.doSomething();
print(instance.x);

completionHandlers.first?();
print(instance.x);


print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count);
/*
 Even though the first element of the customersInLine array is removed by the code inside the closure, the array element isn’t removed until the closure is actually called. If the closure is never called, the expression inside the closure is never evaluated, which means the array element is never removed.
 */

server(customer: {customersInLine.remove(at: 0)});
// call with autoclosure tag
server2(customer: customersInLine.remove(at: 0));

addCustomer(addCustomer: "Felix");
print(customersInLine.count);
print(customerAddition.count);
// Prints "Now serving Chris!"
print(customersInLine.count)

print(customerAdditions())
print(customersInLine.count)


for (place, customer) in customersInLine.enumerated() {
    print("\(customer) is \(place + 1) in line");
}

print(performMul()(4, 6))
// instead of the code above:
print(returnedClosure(8,9)); // 72


print(addition(5,5));
print(divide(10, 5));
print(subtract(10, 5));


print(goodWeather("Sunny"));
print(badWeather("Raining"));


print(squared) // [1, 4, 9, 16, 25]


print("---------------------")
// ENUMS
printDirection(direction);


print(iterateEnum());
// this will override the previous declaration
barcodeProduct = .qrCode("AHJFIBHNFJKNKJBDE");
// you can extract the asociated values with a switch statement for use
switch barcodeProduct {
case .upc(let numberSystem, let manufactur, let product, let check):
    print(" \(numberSystem), \(manufactur), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}


print(compass); // east


let position = 11;
// example use of Optional Binding to try to access a planets raw value of 11 if available
if let somePlanet = Planet(rawValue: position) {
    switch somePlanet {
    case .earth:
        print("Mostly Water");
    default:
        print("Not good food");
    }
} else {
    print("There isnt a planet with that name");
}

// The statement if let somePlanet = Planet(rawValue: 11) creates an optional Planet, and sets somePlanet to the value of that optional Planet if it can be retrieved. 


print(person?.age ?? 44);
print(personStruct?.age ?? 31);


print("The width of the resolution is \(someResolution.width)");
SomeVideo.resolution.width = 5360;
var videoRes = SomeVideo.resolution.width;
print("The width for the video is \(videoRes)");

print("------------------------- \n")


print("The original width for the cinema that has been copied from vga is:  \(cinema.width)");
cinema.width = 999;
print("The changed width for the cinema is \(cinema.width)");
// vga keeps the original value for width (look in structs file to know why
print("The with for vga whic cinema made a copy of is still the original: \(vga.width)")


currentDirection.turnNorth();
print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberDirection)")


tenEighty.resolution = vga
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0


anotherTenEighty.frameRate = 90.0;

print(tenEighty.frameRate); // is now changed to 90.0 due to class being reference types


tenEighty === anotherTenEighty ? print("We are the same") : print("We are not the same")
// we are the same


felix.hasJob = false;

felix.felixHasJob();


rangeOfItems.firstValue = 6;
// the range now represents integer values 6, 7, and 8


manager.data.append("Some text");
manager.data.append("Some more date");

for data in manager.data {
    print(data);
}


for i in 1...7 {
    if i.isMultiple(of: 2) {
        print(i)
    }
}


counter.increment();
print(counter.count);
counter.incrementBy(44);
print(counter.count)



let car = Car(99);
// let carModel = readLine();

print(car.description)



let largetNumbers: [Int] = [2, 77, 88, 34, 3, 6, 99]
var largest = 0;


for number in largetNumbers {
    if number > largest{
        largest = number
    }
}

print(largest)


for i in 0...10 {
    print(i)
}
