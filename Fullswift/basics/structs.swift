//
//  structs.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/24/25.
//

// structs and classes are general purpose constructs for you program
// both structs and classes have the same definition syntax

struct SomePerson {
    var name: String;
    var age: Int?
    
    init(name: String, age: Int? = nil) {
        self.name = name
        self.age = age
    }
}

class PersonTwo {
    var name: String
    var age: Int?
    
    init(name: String, age: Int?) {
        self.name = name
        self.age = age
    }
}


let person: PersonTwo? = PersonTwo(name: "Felix", age: nil);


let personStruct: SomePerson? = SomePerson(name: "Felix Struct", age: nil)


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution() // infers a property -> structure instance
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution();
let SomeVideo = VideoMode();

let vga: Resolution = Resolution(width: 640, height: 480);
// this example above declares a constant and sets it to a Resolution() instance,
// Structs and Enums are value types
// A valuetype is a type whose value is copied when its assigned to a variable or constant, or when it is passed to a function

var cinema = vga;
// cinema is declared variable set to the value of vga, becuase Resolution() is a structure, a copy of the existing instance is made, and this new copy is assigned to cinema.
// even while both havethe same width and height, they both are cmopletely different instances behind the scenes
// cinema is a different instance or copy of the original, so changing cinema instance values will not effect the original vga value it copied

// the same applies to enums

enum CompassPin {
    case north, south, west, east
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPin.east;
let rememberDirection = currentDirection;

// classes are refence types
// unlike value types, reference types are not copied when theyre assigned to a var or let
// same instance is used

let tenEighty = VideoMode();
let anotherTenEighty = tenEighty;
// bcus classes are reference types, both actually refer to the same VideoMode() instance. Just two different names for the same single instance

struct Felix {
    var name: String
    var handsome: Bool = true
    var age: Int
    var hasJob: Bool?
    
    init(name: String, handsome: Bool, age: Int, hasJob: Bool? = nil) {
        self.name = name
        self.handsome = handsome
        self.age = age
        self.hasJob = hasJob
    }
    
    mutating func felixHasJob() {
        
        print("Hello \(name)");
        
        hasJob == true ? print("Finally") : print("Get an iOS Job Now!");
        
    }

    
}


var felix: Felix = Felix(name: "Felix", handsome: true, age: 31)

