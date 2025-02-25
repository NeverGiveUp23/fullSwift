//
//  enumerations.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/24/25.
//

// enums in C are integer values in set
// enums in swift are more flexible -> dont have integer value by default

enum Planets {
    case mercury
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
}

enum Compass {
    case north
    case east
    case south
    case west
}

enum Color {
    case red
    case blue
}

enum Person {
    case name, email, age // you can enter value in one line
}

// ways to call the enum properties
var color: Color = .red;
var planet = Planets.earth;


var direction: Compass = .east;
func printDirection(_ direction: Compass) {
    switch direction {
    case .east:
        print("Direction is east");
        break;
    case .north:
        print("Direction is north");
        break;
    case .south:
        print("Direction is south");
        break;
    case .west:
        print("Direction is west");
        break;
    }
}


// iterating over enums
enum Beverage: CaseIterable {
    case soda
    case juice
    case coffee
}

func iterateEnum() {
    for bev in Beverage.allCases {
        print(bev)
    }
}


enum Barcode {
    case upc (Int, Int, Int, Int)
    case qrCode(String)
}


var barcodeProduct = Barcode.upc(8, 44343, 43323, 2);
// this will override the previous declaration
// barcodeProduct = .qrCode("AHJFIBHNFJKNKJBDE");



// IMplicit raw values
enum Planet: Int {
    case mecury = 1, earth, mars
} // -> mercury has value of 1 and so on in this enum -> explicit raw value


enum CompassPoint: String {
    case south
    case east
    case north
    case west
}
// in the above example the enum has an implicit raw value of String
// so .south explicit value is "south"

let compass = CompassPoint.east.rawValue;
let sunset = CompassPoint.west.rawValue;

let possibelPlanet = Planet(rawValue: 3); // value of mars
// possiblePlanet is of type Planet? and equals Planet.mars


// Recursive Enums -> Enum that has another instance of the enumeration as the associated value for one or more of the enum cases
    
// You indicate it to be recursive by writing 'indirect' before it
// which tells the compiler to insert the layer of indirection
enum Operation {
    case number(Int)
    indirect case addTogether(Operation, Operation)
    indirect case multiplcation(Operation, Operation)
}


// you can also write indirect before the beginning of the enumeration to enable the indirection
indirect enum ArithmeticExpression {
    case number(Int)
    case additon(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
// thsi enum can store three types of cases, a plain number, the addition of two expressions and the same for multiplication.
// add and multiply have the enum as associated values

let five = ArithmeticExpression.number(5);
let four = ArithmeticExpression.number(4);
let additionAgain = ArithmeticExpression.additon(four, five);
let product = ArithmeticExpression.multiplication(additionAgain, ArithmeticExpression.number(2));
