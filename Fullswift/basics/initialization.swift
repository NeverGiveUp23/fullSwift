//
//  initialization.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 3/7/25.
//

// Initialization -> sets the inital value for a type's stored properties and perform one-time setup
// it is the process of preparing an instance of a class, struct, or enum for use.


struct Heat {
    var temp: Double;
    
    init(){ // empty initializer
        temp = 32.2;
    }
}

var f = Heat(); // no need to pass in values for the class since the init is empty
var fPrint = "The default heat is \(f.temp)";

struct Weather {
    var temp: Double;
    
    init(fromTemp heat: Double){
        temp = heat - 10.9;
    }
}

var weather = Weather(fromTemp: 55.9);

// Parameter names and argument labels
struct ColorBoard {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double){
        self.red = red;
        self.green = green;
        self.blue = blue;
    }
    init(white: Double){
        red = white;
        green = white;
        blue = white;
    }
}

let magenta = ColorBoard(red: 1.0, green: 2.0, blue: 3.0);
let halfGreen = ColorBoard(white: 3.9); // sme struct, different init()
// cannot call these initializers w/o using argument labels

//  let green = ColorBoard(3.9, 8.9, 9.9); -> Error: missing argument labels


// Initalizers without argument labels
struct Celcius {
    var tempInCelcius: Double;
    init(fromFahrenheit fahrenheit: Double){
        tempInCelcius = (fahrenheit - 32.0) / 1.8;
    }
    init(fromKelvin kelvin: Double){
        tempInCelcius = kelvin - 273.9;
    }
    init(_ celcius: Double){ // -> no argument label, like in no argument label in functions
        tempInCelcius = celcius;
    }
}

// call with no label
let bodyTemp = Celcius(33.8);


// Optional Property Types

class SurveyQ {
    var text: String?
    var res: String?
    
    init(text: String){
        self.text = text;
    }
    
    init(res: String){
        self.res = res;
    }
    
    func ask(){
        print(text!);
    }
    
    func respond(){
        print(res!);
    }
}

let cheesyQ = SurveyQ(text: "What is your name?");
let cheesyR = SurveyQ(res: "Yes i do have a name");



// Default Initializers
// swift provids a default init for any struct or class that provides default values for all its props and doesnt provide at least one init itself

class ShoppingList {
    var name: String?
    var quantity = 1;
    var purchased = false;
}

var item = ShoppingList(); // default init()
// Because all props of the ShoppingLust class have default values, and because its a base class with no superclass, ShoppingList automatically gains a default initilializer implementation that creates a new instance with all of its props set to their default values.

// (The name property is an optional String property, and so it automatically recieves a default value of nil, even though this value isnt written in the code)

// Structs automatically recive a memberwise initializer if they dont define any of their own custom initializer.

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.2, height: 2.2);

// you call a member wise init, you can omit the values for any properties that have default values.

let zeroByTwo = Size(height: 4.0);


class Motor {
    var numberOfWheels = 0;
    var description: String {
        return "This motor has \(numberOfWheels) wheels"
    }
}

class Bicylce: Motor {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}


let bicycle = Bicylce();
// bicylce.description = 2 wheels.

class Food {
    var name: String
    init(name: String){
        self.name = name
    }
    convenience init() {
        self.init(name: "unamed food");
    }
}

let mysteryMeat = Food(); // mystery meats name is 'unamed Food'

class Recipe: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String){
        self.init(name: name, quantity: 1)
    }
}
let sixEggs = Recipe(name: "Eggs", quantity: 6)

class Shopping: Recipe {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " 🛒" : " x"
        return output
    }
}

var breakfastList = [
    Shopping(),
    Shopping(name: "Bacon"),
    Shopping(name: "Eggs", quantity: 6),
]


