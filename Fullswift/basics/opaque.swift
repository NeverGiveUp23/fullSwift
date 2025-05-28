//
//  opaque.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 5/28/25.
//


// Swift provide opaque types to hide details about a values type: opaque and protocol types.
// Hiding type information is useful at boundaries between a module and code that calls into that module

/*
 A function or method that returns an opaque type hides its return value’s type information. Instead of providing a concrete type as the function’s return type, the return value is described in terms of the protocols it supports. Opaque types preserve type identity — the compiler has access to the type information, but clients of the module don’t.
 */

/*
 The Problem That Opaque Types Solve

 For example, suppose you’re writing a module that draws ASCII art shapes. The basic characteristic of an ASCII art shape is a draw() function that returns the string representation of that shape, which you can use as the requirement for the Shape protocol:
 */

protocol Shape {
    func draw() -> String
}

struct Triangles: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangles(size: 3)
// *
// **
// ***


/*
 You could use generics to implement operations like flipping a shape vertically, as shown in the code below. However, there’s an important limitation to this approach: The flipped result exposes the exact generic types that were used to create it.
 */

struct FlippedShape<S: Shape>: Shape {
    var shape: S
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

let flippedTriangle = FlippedShape(shape: smallTriangle)


struct JoinedShape<S: Shape, U: Shape>: Shape {
    var top: S
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

let joinedTriangleAndSquare = JoinedShape(top: smallTriangle, bottom: flippedTriangle)

// Returning an opaque type
// You can think of an opaque type like being the reverse of generic type. Generics types let the code that calls a function pick the type for that functions parameters and return value in a way thats abstracted away from the function implementation.
// For example -> the function in the following code returns a type that depends on its caller
func max<T>(_ a: T, _ b: T) -> T where T: Comparable {
    return a < b ? b : a // dummy return for no compile error
}

// The code that calls the max() function chooses the values for a and b, and the type of those values determine the concrete type of T. The calling code can use any type that conforms to the Comparable protocol.
// The code inside the function is written in a general way so it can handle whatever type the caller provides.

// These roles are reversed for a function with an opaque return type. An opaque type lets the function implementation pick the type for the value it returns in a way thats abstracted away from the code that calles the function.

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangles(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(
            top: middle,
            bottom: bottom)
    )
    return trapezoid
}

let trapezoid: some Shape = makeTrapezoid()
// the makeTrapezoid() function in this example declares its return type as 'some Shape'; as a result, the function returns a value of some given type that conforms to the Shape protocol, without specifying any particular concrete type.

// combining generics with opaque
func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}
func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    return JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangle: some Shape = join(smallTriangle, flip(smallTriangle))
