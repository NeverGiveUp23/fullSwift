//
//  generics.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 5/27/25.
//
import Foundation

// Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner.

// Swift standard library is built with generic code.

// Array and Dictionary types are generic collections.

// The problem that generics solve
func swapTwoIntsValues(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

// *** -> 'inout' operator allows you to mutate the functions params within the function body

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let tempA = a
    a = b
    b = tempA
}

// as you can see we will be writing the same function for different types which is not what we want to do

// generic functions can work with any type.
func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let tempA = a
    a = b
    b = tempA
}
// The generic function above uses a placeholder type named 'T' in this case, instead of the actual type name( such as Int, String, Double). The placeholder doesnt say what T should be, that will be up to the programmer when calling the function.
// but it does say that a and b are of the same type 'T'

// here is a non-generic stack implementation
struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
// this structure above uses and array property called items to store the values in the stack.
// Stack provides two methods, push and pop, to push and pop values on and off the stack. These methods are marked as 'mutating', becuase they need to modify(or mutate) the structures items array


// Here is a generic version of Stack
struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
// Note how the generic version of Stack is essentially the same as the nongeneric version, but with a type parameter called Element instead of an actual type of Int.
// Calling <Element> immediatly after the structures name and replacing types with Element instead of Int

// Because it’s a generic type, Stack can be used to create a stack of any valid type in Swift, in a similar manner to Array and Dictionary.



// Extending a generic type

// When you extend a generic type, you dont provide a type parameter list as part of the extensions definition. Instead, the type parameter list from the original type definition is available within the body of the extension

// This an extension of the generic Stack implementation
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items.last
    }
}
// Notice how we can still use the generic param of 'Element' in the extension as well as 'items'.
// The topitem property returns an optional value of type Element. If the stack isd empty, topItem returns nil; If the stack is not empty, topItem returns the final item in the items array.



// Type constraints
// The swapTwoValues(_:_:) function and the Stack type can work with any type. However, it’s sometimes useful to enforce certain type constraints on the types that can be used with generic functions and generic types. Type constraints specify that a type parameter must inherit from a specific class, or conform to a particular protocol or protocol composition.

// here is a non-generic typecontraintfunction
func findIndexInt(ofString valueTofind: String, in array: [String]) -> Int? {
    
    for(index, value) in array.enumerated(){
        if value == valueTofind{
            return index
        }
    }
    return nil
}

// this is a generic version
func findIndex<T>(of valueToFind: T, in array: [T]) -> Int? {
    for(index, _ ) in array.enumerated(){
        // if value == valueToFind { // return compile time error
            return index
        }
    return nil
    }
// this program above does not compile, the problem lies with the equality check in the if statement. Not every type in swift can be compared with the equal(==) operator.

// *** If you create your own class or structure to represent a complex data model, for example, then the meaning of “equal to” for that class or structure isn’t something that Swift can guess for you. ***


func findGenericIndex<T: Equatable>(of valueToFind: T, in arr: [T]) -> Int? {
    for (index, value) in arr.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}
// code returns no error during compile time
// the single param for findGenericIndex is written as T: Equatable, which means "any type T conforms to the Equatable protocol".


struct Movies: Codable {
    let title: String
}

struct User: Codable {
    let name: String
}

protocol WebServerProtocol: class {
    associatedtype Model
    func getAll(url: URL, completion: (Result<Model>, Error) -> Void)
}


class MovieService: WebServerProtocol {
    
}
