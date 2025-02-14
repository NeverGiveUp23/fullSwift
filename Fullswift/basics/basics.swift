//
//  basics.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/12/25.
//
// common fundamental data types

var age: Int = 1; // Integer
var float: Double = 33.8; // floating point values
var test: String = "Hello World"; // for text values
var bool: Bool = true; // for boolean value

// the 'var' keyword is a changable value
// whereas a constant value needs to be declared with the 'let' keyword

let maximumNumberOfLoginAttempts = 5; // let allows this variable's value to NOT CHANGE -> in this case we do not want this value to change since it pertains to login attempts
var currentLoginAttempts = 0; // var allows this variable's value TO CHANGE -> in this case it needs to change if the login attempts fail or if you need to keep track of attempts

// if programs in your code NEED TO CHANGE use the 'var' keyword
// if programs DO NOT NEED TO CHANGE use the 'let' keyword

// you can assign its inital value later, as long as it's guarunteed to have a value before the first time you read it

var environment = "development"
let maximumAttempts: Int // has no value yet

if environment == "development" {
    maximumAttempts = 100
} else {
    maximumAttempts = 5;
}


// you can declare multiple constants or multiple variables on the same line, seperated by commas
var x = 0.0, y = 0.0, z = 0.0

// you can provide type annotation when you declare a const or var.
var welcomeMesssage: String = "Hello World!"
let pi: Double = 3.14

// The colon in the declaration means '...of type...', the code abovew reads as "Declare a variable called 'welcomeMessage of type String'
// the phrase "of type String" means "can store any String value".
welcomeMesssage = "Goodbye World!" // can be set to any String type due to the type and variable declaration

// you can define multiple related variables of the same type on a single line.
var red, gread, blue: Double


// Printing Constants and Var
// you can print the current value of a constant or variable with the print(_:seperator:terminator:) function
// the print(_:seperator:terminator:) is a global function that prints one or more values to an appropriate output.
// to print a value w/o a line break, pass an empty string as th terminator -> print(someValue, terminator: "")


// interger bounds
// swift has the same thing as in C/C++ with signed and unsigned int in 8, 16, 32, and 64 bit forms
let minValue: UInt8 = UInt8.min;
let maxValue: UInt8 = UInt8.max;

// you wouldnt need to pick your int size, as swift has native Int which has the same size as the current platforms native word size:
// on a 32 bit platform. Int is the same size as Int32
// on a 64-bit platform. Int is the same size as Int64

// UInt -> unsigned integers is the same size natively like Int

// Floating Point Numbers
// they can represent a much wider range of values than interger types
// Double -> reps a 64-bit floating point number
// Float -> reps a 32-bit floating point number

// Swift uses type Inference to wrk out the appriote type if not declared -> it enables the compiler to deduce the type of a particular expression automatically.
// Type inference is useful when you declare a constant or variable with an intial value -> literal value -> which is a value that appears directly in your code -> let name = 43 -> 43 is literal

let cannotBeNeg: UInt8 = -1;
// UInt8 can't store negative numbers, and so this will report an error
let big: UInt8 = 256;
// UInt8 goes from 0 - 255, 256 will be too big(pause)

// Integer and floating point conversions
// conversions between floating points and integer numeric types must be made explicit
let three = 3;
let pi2 = 0.14159;
let doublePi = Double(three) + pi2;
// pi equals 3.14159, and is inferred to be of type Double
// here the value of the constant is used to create a new value of type Double, so that both sides of the addition are of the same type.

let integerPI = Int(doublePi);
// integerPi equals 3, and is inferred to be of type Int

// * Floating point values always TRUNCATED when usd to initialie a new integer value in this way
// this means that 4.75 becomes 4, and -3.9 become -3

// TYPE ALIASES -> defines an alternative name for an existing type.
// use the 'typealias' keyword -> they are useful when you want to refer to an existing type by name that would be more appropriate

typealias AudioSample = Int16;
// once you defined you typealias, you ca use the alias anywhere tou might use the original name
var maxAmpFound = AudioSample.min; // -> now 0
// Audio sample is defined as an alias for UInt16. Becuase its an alias, the call to AudioSample.min actually call for UInt16.min under the hood.





