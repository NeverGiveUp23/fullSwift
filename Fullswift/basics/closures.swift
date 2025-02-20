//
//  closures.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/19/25.
//

// closures are self-contained blocks of functionality that can be passed around and used in your code.

// Closures can capture and store references to any constants and variables from the context in which theyre defined.

let newNames: [String] = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    s1 > s2
}
// shorthad arguments  using $0 and $1 as the array elements called a trailing closure
let reveresedNames = newNames.sorted { $0 > $1 }

let greet = {
    print("Hello")
}
// closure accepting two params
let add: (Int, Int) -> Int = { (a, b) in
    a + b
}

let multiply: (Int, Int) -> Int = { (a, b) in
    a * b
}

let addAnother: (Int, Int) -> Int = {
    $0 + $1
}

let numbers = [1, 2, 3, 4, 5]

// Double each number using map
let doubled = numbers.map { $0 * 2 }

// Filter even numbers
let evens = numbers.filter { $0 % 2 == 0 }
// enumerated allows you to access the index, like so:
let indexedDouble = numbers.enumerated().map { (index, value) in
    "Index \(index): \(value * 2)"
}

// Capturing values and escaping closures
func makeInvrement(incrementAmount: Int) -> () -> Int {
    var total = 0
    let increment: () -> Int = {
        total += incrementAmount
        return total
    }
    return increment
}

let incrementByTwo = makeInvrement(incrementAmount: 2)

/*
 The map(_:) method calls the closure expression once for each item in the array. You don’t need to specify the type of the closure’s input parameter, number, because the type can be inferred from the values in the array to be mapped.

 In this example, the variable number is initialized with the value of the closure’s number parameter, so that the value can be modified within the closure body. (The parameters to functions and closures are always constants.) The closure expression also specifies a return type of String, to indicate the type that will be stored in the mapped output array.

 The closure expression builds a string called output each time it’s called. It calculates the last digit of number by using the remainder operator (number % 10), and uses this digit to look up an appropriate string in the digitNames dictionary. The closure can be used to create a string representation of any integer greater than zero.

 Note

 The call to the digitNames dictionary’s subscript is followed by an exclamation point (!), because dictionary subscripts return an optional value to indicate that the dictionary lookup can fail if the key doesn’t exist. In the example above, it’s guaranteed that number % 10 will always be a valid subscript key for the digitNames dictionary, and so an exclamation point is used to force-unwrap the String value stored in the subscript’s optional return value.

 The string retrieved from the digitNames dictionary is added to the front of output, effectively building a string version of the number in reverse. (The expression number % 10 gives a value of 6 for 16, 8 for 58, and 0 for 510.)

 The number variable is then divided by 10. Because it’s an integer, it’s rounded down during the division, so 16 becomes 1, 58 becomes 5, and 510 becomes 51.

 The process is repeated until number is equal to 0, at which point the output string is returned by the closure, and is added to the output array by the map(_:) method.

 The use of trailing closure syntax in the example above neatly encapsulates the closure’s functionality immediately after the function that closure supports, without needing to wrap the entire closure within the map(_:) method’s outer parentheses.

 If a function takes multiple closures, you omit the argument label for the first trailing closure and you label the remaining trailing closures. For example, the function below loads a picture for a photo gallery:
 */

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine",
]
let newNumbers = [16, 58, 510]

let strings = newNumbers.map { (newNumber) -> String in
    var number = newNumber
    var output = ""

    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

// this is a function that has 1 param. the function returns another function that takes in no params and returns an Int: ( -> () -> Int ).
// the return type of makeIncrement is () -> Int. This means that it returns a function, rather than a simple value.
func makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}
// even tho incrementByTen is declared as a constant it can increment the contents in the closure function, this is because when you declare a constant or variable pointing to a function or closure it references the function or closure, in incrementByTen, its the choice of function or closure that is actually constant, not the function/closure contents in the body.
let incrementByTen = makeIncrement(forIncrement: 10)

// ESCAPING CLOSURES -> A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns.
// @escaping before the parameter’s type to indicate that the closure is allowed to escape.
var completionHandlers: [() -> Void] = []
func someFunctinWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoClosureEscape(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10

    func doSomething() {
        someFunctinWithEscapingClosure {
            self.x = 300
        }
        someFunctionWithNoClosureEscape {
            x = 100
        }
    }
}

let instance = SomeClass()

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let customerProvider = { customersInLine.remove(at: 0) }
let customerAdditions = { customersInLine.append("Felix") }
/*
 Even though the first element of the customersInLine array is removed by the code inside the closure, the array element isn’t removed until the closure is actually called. If the closure is never called, the expression inside the closure is never evaluated, which means the array element is never removed.
 */

// you get the same result in this closure
func server(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

// witht he autoclosure attribute, now you can call the function as if it took a String argument instead of a closure
func server2(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
var customerAddition: [() -> String] = []
func addCustomer(
    addCustomer customerProvider: @autoclosure @escaping () -> String
) {
    customerAddition.append(customerProvider)
}

let multiplyAgain: (Int, Int) -> Int = { $0 * $1 }

let mul = multiplyAgain(5,7);
func performMul() -> (Int, Int) -> Int {multiplyAgain;}
// store function that takes in a closure in a const or variable
let returnedClosure = performMul();


// this is useful if you want to do multiple operations and call easily
func createOperation(_ operation: String) -> (Int, Int) -> Int {
    switch operation{
    case "add":
        {$0 + $1};
    case "subtract":
        {$0 - $1}
    case "multiply":
        {$0 * $1};
    case "divide":
        {$0 / $1}
    default:
        {$0 + $1} // default to addition
    
    }
}

let addition = createOperation("add");
let divide = createOperation("DiVidE".lowercased())
let subtract = createOperation("subtract");


func weather(_ weather: Bool) -> (String) -> String {
    switch weather{
    case true:
        {"\($0) is good"}
    case false:
        {"\($0) is not good"}
    }
}

let goodWeather = weather(true);
let badWeather = weather(false);

let concate: (String, String) -> String = {(str1: String, str2: String) -> String in
     str1 + str2;
}

let sortNames = ["Alice", "Bob", "Charlie", "Dave"];
let sortedNamedAgain = sortNames.sorted {$0.count < $1.count};

func applyOperation(to numbers: [Int], operation: (Int) -> Int) -> [Int] {
    numbers.map(operation);
}
let squared = applyOperation(to: numbers, operation: {$0 * $0});
