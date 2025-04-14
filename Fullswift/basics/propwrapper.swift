//
//  propwrapper.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 4/28/25.
//

// Property wrappers adds a layer of seperation between code that manages how a property is stored and the code that defines the property.

// for example, if you have properties that provide thread-safe checks or store their underlying data in a database, you have to write that code on every property. When you use a property wrapper, you write the management code once when you define the wrapper, and then reuse that management code.

/*
 To define a property wrapper, you make a structure, enumeration, or class that defines a wrappedValue property. In the code below, the TwelveOrLess structure ensures that the value it wraps always contains a number less than or equal to 12. If you ask it to store a larger number, it stores 12 instead.
 */

@propertyWrapper
struct TwelveOrLess {
    private var number = 0;
    var wrappedValue: Int {
        get { return number}
        
        set {
            number = min(newValue, 12);
        }
    }
}


// you apply the wrapper by writing the wrappers name before the property as an attribute.

struct SmallRctangle {
    @TwelveOrLess var width: Int
    @TwelveOrLess var height: Int //
}

var rectangle = SmallRctangle();


// here is the same SmallRectangle struct which lists adn wraps its properties expicitly

struct SmallRectangle {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    
    var height: Int {
        get {return _height.wrappedValue}
        
        set {
            _height.wrappedValue = newValue
        }
    }
    
    var width: Int {
        get {return _width.wrappedValue}
        
        set {
            _width.wrappedValue = newValue
        }
    }
}
// The _height and _width properties store an instance of the property wrapper, TwelveOrLess. The getter and setter for height and width wrap access to the wrappedValue property.


// SETTING INITAL VALUES FOR WRAPPED PROPERTIES


