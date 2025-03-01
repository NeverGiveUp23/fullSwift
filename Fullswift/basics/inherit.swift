//
//  inherit.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 3/1/25.
//



class Vehicle {
    var speed: Int
    var description: String {
        return "The current speed is \(speed) miles per hour"
    }
    init(_ speed: Int) {
        self.speed = speed
    }
}


class Car: Vehicle {
    var model: String = ""
    
    // you can override methods within the superclass like so: with the override keyword
    override var description: String {
        // super just returns the original context in the superclass method
        return super.description + " in my \(model)."
    }
}

// optional

class SurveyQuestion {
    var question: String
    var response: String?
    
    init(question: String) {
        self.question = question
    }
    
    func ask(){
        print(question);
    }
}


