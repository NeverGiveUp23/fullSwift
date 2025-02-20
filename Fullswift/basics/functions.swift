//
//  controlflow.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/19/25.
//

func greet(person: String) -> String {
    let greeting = "Hello, " + person;
    return greeting;
}

func alreadyGreeted(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greet(person: person)
    } else {
        return "I greeted you already";
    }
}

func printAndCount(string: String) -> Int {
    print(string);
    return string.count;
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string);
}


// optional tuples values when a value has a potential to have "no value"
// You write an optional tuple return type by placing a question mark after the tuple type’s closing parenthesis, such as (Int, Int)? or (String, Int, Bool)?.
// To handle an empty array safely, write the minMax(array:) function with an optional tuple return type and return a value of nil when the array is empty

func minMax(array: [Int]) -> (min: Int, max: Int)?{
    if array.isEmpty {return nil}; //  edge case
    
    var currentMin = array[0];
    var currentMax = array[0];
    
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value;
        } else if value > currentMax{
            currentMax = value;
        }
    }
    return (currentMin, currentMax);
}; // the return value depends on a tuple of two values

// function with implicit returns
// if the entire body of the function id a single expression, the function implicitly returns that expression.
func newGreeting(for person: String) -> String {
    "Hello, " + person + "!";
}; // this is usually good for one liner functions
// this prints the same value as this function below
func fullGreeting(for person: String) -> String {
    return  "Hello, " + person + "!";
} // except i have to explicitly say return for this one
// -> for: is an argument label

// ARGUMENT LABELS
func someFunction(argumentLabel label: String) {
    print(label);
}
func anotherGreet(person:String, from hometown: String) -> String {
    "Hello \(person) from \(hometown)";
};
// print(anotherGreet(person: "Felix", from: Bronx));
// instead of hometown: -> it is from: when you call the function.

func paramWithDefault(paramWODef: Int, ParamWDefault: Int = 22){
    // logic
}

// Vaiadic parameters -> accepts zero or more values of specified type
func vaidaic(_ numbers: Double...) -> Double{
    var total: Double = 0;
       for number in numbers {
           total += number;
       }
    return total / Double(numbers.count);
}


// inout params
// function params are constant by default
// trying to change the value of a function param from the function body results in a compile time error

// if you want to modify a function param, define the param as an in-out param
// place the inout cammand before the params type

// An in-out param has a values that passed 'in' to the function, is modified by the function, and is passed back 'out' of the function to replace the original value.
// SWAP example
func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let temp = a;
    a = b;
    b = temp;
}

// random function adding int to test using function types
func addInts(_ a: Int, _ b: Int) -> Int {
    a + b;
}

func multiplyInts(_ a: Int, _ b: Int) -> Int {
    a * b;
}

// function types as param types
func printMathFunction(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int){
    print(mathFunction(a, b));
}


// function types as return types
func stepForward(_ input: Int) -> Int {
    input + 1;
}

func stepBackwards(_ input: Int) -> Int {
    input - 1;
}

func chooseStepFunction(backword: Bool) -> (Int) -> Int { // returns the function and in turn returns a Int
    backword ? stepBackwards : stepForward;
}


