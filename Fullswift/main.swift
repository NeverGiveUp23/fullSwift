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



var arr: [Int] = [43, 1, 4, 99, 83, 2, 3, 5];

print(insertionSort(arr)); // [1, 2, 3, 4, 5, 43, 83, 99]

print(arr); // [43, 1, 4, 99, 83, 2, 3, 5] -> original is unaffected


print(zeroByTwo.height, zeroByTwo.width);


print("----------- Property Wrappers -----------")

print(rectangle.height); // 0, since the property wrapper starts you at 0
rectangle.height = 100; // in the property wrapper, it chack to make sure the number is less than or equal to 12.
print(rectangle.height); // 12

/*
 The height and width properties get their initial values from the definition of TwelveOrLess, which sets TwelveOrLess.number to zero. The setter in TwelveOrLess treats 10 as a valid value so storing the number 10 in rectangle.height proceeds as written. However, 24 is larger than TwelveOrLess allows, so trying to store 24 end up setting rectangle.height to 12 instead, the largest allowed value.
 */


print(zeroRectangle.height, zeroRectangle.width) // 0 0
zeroRectangle.height = 124;
print(zeroRectangle.height, zeroRectangle.width) // 100 0

print(unitRectangle.height, unitRectangle.width) // 1 1

print(narrowRectangle.height, narrowRectangle.width) // 2 3

narrowRectangle.height = 100;
narrowRectangle.width = 200;
print(narrowRectangle.height, narrowRectangle.width) // 5 4

print(mixedRectangle.height)
// Prints "1"


mixedRectangle.height = 120
print(mixedRectangle.height)
// Prints "100" since the maximum is 100

print(mixedRectangle.width) // prints "2"
mixedRectangle.width = 12
print(mixedRectangle.width) // prints "9"

someStructure.someNumber = 4
print(someStructure.$someNumber, someStructure.someNumber)
// Prints "false 4"


someStructure.someNumber = 55
print(someStructure.$someNumber, someStructure.someNumber)
// Prints "true 12"

/*
 Writing someStructure.$someNumber accesses the wrapper’s projected value. After storing a small number like four, the value of someStructure.$someNumber is false. However, the projected value is true after trying to store a number that’s too large, like 55.
 */

var sizedRectangle = SizedRectangle()
print(sizedRectangle.resize(to: TwoSize.large))



print("------------- Mutating --------------")
print(testInstance.test) // prints 'Test', which is the original value
testInstance.test = "Hello, World!" // changing the underlying value of test in the struct
print(testInstance.test) // prints 'Hello World'


print("------------ Type Methods --------------")
SomeAClass.someTypeMethod() // this is how you call a type method on a class. Dot syntax


var player = Player(name: "Felix");
player.complete(level: 1)
print("\(player.playerName) has completed level \(LevelTracker.highestLevelUnlocked)")

player = Player(name: "BGeto")

if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("Level is not unlocked")
}


var classes = ClassRoom()
print(classes.classes)

classes.addClasses(className: "Math")
print(classes.classes)
classes.addClasses(className: "English")
print(classes.classes)
classes.addClasses(className: "Science")
print(classes.classes)

classes.addClasses(className: "Math")
print(classes.classes)
classes.addClasses(className: "English")
print(classes.classes)
classes.addClasses(className: "Science")
print(classes.classes)

classes.addClasses(className: "Math")
print(classes.classes)
classes.addClasses(className: "English")
print(classes.classes)
classes.addClasses(className: "Science")
print(classes.classes)

classes.addClasses(className: "Math")
print(classes.classes)
classes.addClasses(className: "English")
print(classes.classes)
classes.addClasses(className: "Science")
print(classes.classes)

classes.addClasses(className: "Math")
print(classes.classes)
classes.addClasses(className: "English")
print(classes.classes)
classes.addClasses(className: "Science")
print(classes.classes)

var number = 1
for cn in classes.classNames {
    if number <= 12 {
        print("\(number): \(cn)")
        number += 1
    }else {
        print("Sorry, you can't take more than 12 classes")
    }
}


print("------------- Inheritance --------------")
someVehicle.currentSpeed = 150
print(someVehicle.description) // traveling at 150.0 miles per hour
someVehicle.makeNoise()
bicylce.currentSpeed = 10
print(bicylce.description)
bicylce.makeNoise()



print("------------- Initialization --------------")

breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true
breakfastList[1].purchased = true
breakfastList[2].purchased = false

func getList(_ list: [Shopping]) {
    for item in list {
        print(item.description)
    }
}

getList(breakfastList)


print("------------- Optional Chaining --------------")

let john = People()
john.residence = Residence()
// let roomCount = john.residence!.numberOfRooms // trigger a runtime error when force unwrapping
// Fatal error: Unexpectedly found nil while unwrapping an Optional value

if let roomCount = john.residence?.numberOfRooms {
    print("john has \(roomCount) rooms")
} else {
    print("Unable to get rooms")
}
// Prints "John's residence has 1 room(s)."

let someAddress = Address()
someAddress.buildingNumber = 1001
someAddress.buildingName = "Apple Inc."
john.residence?.address = someAddress



print("------------- Handling Errors --------------")
//// throw VendingMachineError.insufficientFunds(coinsNeeded: 4)
//var vendingMachine = VendingMachine()
//// try keyword due to it possibly catching an error.
//try buySnack(person: "Bob", vendingMachine: vendingMachine)

print("------------- Concurrency --------------")
let photoNames = try await listPhotosSleep(inGallery: "Traveling")
//let sortedNames = photoNames.sorted()
//let name = sortedNames[0]
//let photo = await loadPhoto(named: name)

let firstPhoto = await listPhotoss(inGallery: photoNames[0])
let secondPhoto = await listPhotoss(inGallery: photoNames[1])
let thirdPhoto = await listPhotoss(inGallery: photoNames[2])

let photos1 = [firstPhoto, secondPhoto, thirdPhoto]

async let firstPhoto1 = listPhotosSleep(inGallery: photoNames[0])
async let secondPhoto2 = listPhotosSleep(inGallery: photoNames[1])
async let thirdPhoto3 = listPhotosSleep(inGallery: photoNames[2])

let photos = await print([firstPhoto1, secondPhoto2, thirdPhoto3])

print(await logger.max) // prints 85


print("------------- Type Casting --------------")

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("Media library contains \(movieCount) movies and \(songCount) songs")
// Prints "Media library contains 2 movies and 3 songs"


for item in library {
    if let movie = item as? Movie {
        print("Movie director: \(movie.director)")
    } else if let song = item as? Song {
        print("Song artist: \(song.artist)")
    }
}


print("------------ Generics --------------")
var someIntValue = 12
var secondIntValue = 44

swapTwoValues(&someIntValue, &secondIntValue)

var SomeStringValue = "Hello"
var secondSomeStringValue = "World"

swapTwoValues(&SomeStringValue, &secondSomeStringValue)


var stackOfString = Stack<String>()
stackOfString.push("Hello")
stackOfString.push("World")
stackOfString.push("Felix")
let stringRemovedFromTop = stackOfString.pop()
print(stringRemovedFromTop) // Felix

var stackOfInts = Stack<Int>()
stackOfInts.push(1)
stackOfInts.push(2)
stackOfInts.push(3)
stackOfInts.push(4)
stackOfInts.push(5)
let removedFromTop = stackOfInts.pop()
print(removedFromTop) // 5

// optional reading 'if let'
if let readLastItem = stackOfInts.topItem {
    print(readLastItem)
}

if let readLastString = stackOfString.topItem {
    print(readLastString)
}

let stringsArray = ["cat", "dog", "llama", "parakeet", "terrapin"]

if let foundIndex = findIndexInt(ofString: "dog", in: stringsArray) {
    print("The index of dog is \(foundIndex)")
} // returns 1

if let doubleIndex = findGenericIndex(of: "Felix", in: ["Gabe", "Popper", "Felix", "Daisy", "Buster"]) {
    print("The index of Felix is \(doubleIndex)")
} // The index of Felix is 2

print("-------------- Opaque Types --------------")

print(smallTriangle.draw())
print(flippedTriangle.draw())
print(joinedTriangleAndSquare.draw())
print("-------------- Opaque Trapezoid --------------")
print(trapezoid.draw())
print( opaqueJoinedTriangle.draw())



reference1 = ArcPerson(name: "John Appleseed") // create a new ARCPerson instance and assign it to one of the three variables
// Prints "John Appleseed is being initialized"


