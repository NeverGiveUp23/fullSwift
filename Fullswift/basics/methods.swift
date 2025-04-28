//
//  methods.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 3/1/25.
//

// Methods
class Counter {
    var count = 0
    
    func increment() {
       count += 1
    }
    func decrement(){
        count -= 1
    }
    
    func incrementBy(_ amount: Int){
        count += amount;
    }
    
    func reset() {
        count = 0;
    }
}


let counter = Counter()


struct Point {
    var x = 0.0 , y = 0.0
    
    // using self to identify the function x and global x
    func isToTheRight(x: Double) -> Bool {
        return self.x > x;
    }
}


let somePoint = Point(x: 4.0, y: 7.0);

// modifying values from within instance methods
// structs and enums are value types, by default value types cannot be modified
// if you need to modify those -> use the mutating keyword before func

// mutating allows for you to mutate(change) it properties from within the method
struct PointAgain {
    var x = 0.0 , y = 0.0
    
    // using self to identify the function x and global x
    mutating func isToTheRight(xDelta: Double) {
        x += xDelta;
    }
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
    
}

struct Test {
    var test = "Test";
    
    mutating func changeTest(t test: String) {
        self.test = test;
    }
}

var testInstance = Test();



