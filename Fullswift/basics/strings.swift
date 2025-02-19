//
//  strings.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/19/25.
//

// strings can be accessed in a number of ways, including as a collection of Character values

let wiseWords = "\"imagination is more important than knowledge\" - Einstein";

let dollarSign = "\u{24}";
let blackHeart = "\u{2665}";
let sparklingHeart = "\u{1F496}";

// two ways to initialize empty strings
var emptyString: String = ""; // empty string literal
var anotherEmptyString = String(); // initializer syntax

var variableString = "Horse";

func printChars(_ chars: String) {
    for character in chars {
        print(character);
    }
}

// you can create a standalone Char
let exclamationPoint: Character = "!";

// string values can beconstructed by passing an array of Character values
let catCharactersL: [Character] = ["C", "A", "T", "!"];
let catString = String(catCharactersL);

let string1 = "Hello";
let string2 = " world";
var stringConcat = string1 + string2; // hello world


// String indices -> Accessing and modifying a string
// each string has an associated index type. String.Index
let greeting = "Hello";

// inserting an removing

var welcome = "Hello";


// SubStrings
let anotherGreeting = "Hello, world";
let range = anotherGreeting.firstIndex(of: ",") ?? anotherGreeting.endIndex;
let beginning = anotherGreeting[..<range];
// beginning is "Hello"
let newString = String(beginning); // now holds long term storage of the substring

let romeoAndJuliet: [String] = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

func scenes(_ sceneArray: [String]) {
    var act1Scenes = 0;
    
    for scene in sceneArray {
        if scene.hasPrefix("Act 1"){ // check if prefix in the array has Act 1
            act1Scenes += 1; // increment if seen
        }
    }
    print("There are \(act1Scenes) scenes in Act 1");
}

func endScene(_ actArray: [String]) {
    var mansionCount = 0;
    var cellCount = 0;
    
    for scene in actArray {
        if scene.hasSuffix("mansion"){
            mansionCount += 1;
        } else if  scene.hasSuffix("cell"){
            cellCount += 1;
        }
    }
    print("\(mansionCount) mansion scenes, and \(cellCount) cell scenes");
}
