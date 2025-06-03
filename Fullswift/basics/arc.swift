//
//  arc.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 5/28/25.
//

// ARC = Automatic Reference Counting
// ARC manages your memory for you, freeing memory and deleting memory when not in use. This is for class instances only
// Struct and Enums are value types and not reference types like class instances.

// Everytime you create a new instance of a class, ARC allocates a chunk of memory to store information about that instance. This memory holds information about the type of instance together with the values, and any stored properties of the class.

//ARC will not deallocate an instance as long as at least one active reference to that instance exists.

//Here’s an example of how Automatic Reference Counting works. This example starts with a simple class called ARCPerson, which defines a stored constant property called name:

class ArcPerson {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

// The Person class has an initializer that sets the instance’s name property and prints a message to indicate that initialization is underway. The Person class also has a deinitializer that prints a message when an instance of the class is deallocated.

var reference1: ArcPerson?
var reference2: ArcPerson?
var reference3: ArcPerson?
// The above code snippet defines three variables of type Person?, which are used to set up multiple references to a new Person instance in subsequent code snippets. Because these variables are of an optional type (Person?, not Person), they’re automatically initialized with a value of nil, and don’t currently reference a Person instance.
//
//reference1 = ArcPerson(name: "John Appleseed") // create a new ARCPerson instance and assign it to one of the three variables
//// Prints "John Appleseed is being initialized"
//
