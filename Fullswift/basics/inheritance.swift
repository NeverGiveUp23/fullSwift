//
//  inheritance.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 4/28/25.
//

// A class can inherit methods and properties from other classes. When a class inherits from another class, it is called a 'subclass'. and the class it inherits is a 'superclass'

class AnotherVehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        print("honk honk")
    }
}

// create an instance like so
let someVehicle = AnotherVehicle()

// Subclassing -
class Bicycle: AnotherVehicle {
    var wheels: Int = 2
    var hasBasket: Bool = false
    override var description: String {
        return "Bike " + super.description + " with \(wheels) wheels."
    }
    
    override func makeNoise(){
        print("Squeek Squeek")
    }
    
}
let bicylce = Bicycle()
