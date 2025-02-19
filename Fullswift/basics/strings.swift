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



