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
    @TwelveOrLess var height: Int
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

/*
 The code in the examples above sets the initial value for the  wrapped property by giving 'number' an inital value in the definition of TwelveOrLess(). Code that uses this property wrapper cant specify a different initial value for a property thats wrapped.
 
 To support setting an initial value or other customisation, the property wrapper needs an initializer (init()).
 */

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }
    
    init(){
        maximum = 100
        number = 0
    }
    init(wrappedValue: Int){
        maximum = 100
        number = min(wrappedValue, maximum)
    }
    
    init (wrappedValue: Int, maximum: Int){
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

// When you apply a wrapper to a property and you don’t specify an initial value, Swift uses the init() initializer to set up the wrapper

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle();
//  The code inside that initializer sets the initial wrapped value and the initial maximum value, using the default values of zero and 12.

// when you specify an initial value for the property, Swift uses the init(wrappedValue:) initializer to set up the wrapper.
struct UnitRectangle {
    // When you write = 1 on a property with a wrapper, that’s translated into a call to the init(wrappedValue:) initializer.
    @SmallNumber var height = 1
    @SmallNumber var width = 1
}
var unitRectangle = UnitRectangle()


struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()


// By including arguments to the property wrapper, you can set up the initial state in the wrapper or pass other options to the wrapper when its created. You can provide whatever arguments you need to the attribute, and they're passed to the initializer.

// when you include property wrapper arguments, youy can also specify an initial value using assignment
struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()

@propertyWrapper
struct NewSmallNumber{
    private var number: Int
    private(set) var projectedValue: Bool
    
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
                
            }
        }
    }
    init() {
        self.number = 0
        self.projectedValue = false
    }
}

struct SomeStructure {
    @NewSmallNumber var someNumber: Int
}

var someStructure = SomeStructure()

/*
 Writing someStructure.$someNumber accesses the wrapper’s projected value. After storing a small number like four, the value of someStructure.$someNumber is false. However, the projected value is true after trying to store a number that’s too large, like 55.
 
 A property wrapper can return a value of any type as its projected value. In this example, the property wrapper exposes only one piece of information — whether the number was adjusted — so it exposes that Boolean value as its projected value.
 */

enum TwoSize {
    case small, large
}

struct SizedRectangle {
    @NewSmallNumber var height: Int
    @NewSmallNumber var width: Int
    
    mutating func resize(to size: TwoSize) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}


struct AudioChannel {
    static let thresholdLevel = 10;
    static var maxInputLevel = 0;
    
    var currentLevel: Int = 0 {
        didSet { // didSet property observer to check the valueof currentLevel whenever its set.
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevel {
                AudioChannel.maxInputLevel = currentLevel
            }
        }
    }
}
/*
 The AudioChannel structure defines two stored type properties to support its functionality. The first, thresholdLevel, defines the maximum threshold value an audio level can take. This is a constant value of 10 for all AudioChannel instances. If an audio signal comes in with a higher value than 10, it will be capped to this threshold value (as described below).
 
 The currentLevel property has a didSet property observer to check the value of currentLevel whenever it’s set. This observer performs two checks:

     If the new value of currentLevel is greater than the allowed thresholdLevel, the property observer caps currentLevel to thresholdLevel.

     If the new value of currentLevel (after any capping) is higher than any value previously received by any AudioChannel instance, the property observer stores the new currentLevel value in the maxInputLevelForAllChannels type property.
 
 */
