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



// TYPE METHODS
// Instance methods, as described above, are methods that you call on an instance of a particular type. You can also define methods that are called on the type itself. These are called type methods.
// You indicate a type method with the static keyword before the methods func keyword.

// classes can use the class keyword instead, to allow subclasses to override the superclass's implementation of the mathod

class SomeAClass {
    class func someTypeMethod(){
        print(10);
    }
}


struct LevelTracker {
    static var highestLevelUnlocked = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int){
        if  level > highestLevelUnlocked {
            highestLevelUnlocked = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestLevelUnlocked
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

// EXPLANATION OF STATIC AND TYPE METHODS, INSTANCE TYPE AND WHEN TO USE IT.

/*
 3. Memory Implications
 
 Property Type ||  Memory Allocation              ||  Lifetime
 --------------   -------------------------------   -----------
 Instance      || Each instance gets its own copy || Exists as long as the instance exists.
 Static        || Single copy in global memory    || Exists for the entire app runtime.
 
 4. When to Use static vs. Instance Properties
 
 Use Case           ||  Example                                                  || Choice
 -------------------  -----------------------------------------------------------  --------
 Shared state       ||  Highest unlocked level (all players see the same value). || static
 Per-instance state ||  Current level (each player has their own progress).      || Instance property
 
 
 5. Analogy: Bulletin Board vs. Personal Notebook

     'static' Property: Like a bulletin board in a school.

        > Anyone can read/write to it (LevelTracker.highestLevelUnlocked).

        > Changes are visible to everyone.

     'Instance Property': Like a personal notebook (currentLevel).

        > Each student (instance) has their own notebook.

        > Changing one doesn’t affect others.
 
 By separating shared (static) and instance-specific state, your LevelTracker elegantly handles both global progression rules and individual player progress.
 */

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}
