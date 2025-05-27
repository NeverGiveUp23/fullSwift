//
//  errorHandling.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 5/23/25.
//


/*
 Error Handling is the process of responding to and recovering from error conditions in your program.
 Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime.
 */

// swift enums arer great to group values related to error conditions, with associated values allowing for additional information about the nature of an error to be communicated.


enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

// throwing conditons allows you end the execution when something unexpected happens and the normal flow of execution cant continue.

// Ex: -> throw VendingMachineError.insufficientFunds(coinsNeeded: 4);


// Propagating Errors Using Throwing Functions

// To indicate that a function, method, or initializer can throw an error, you write the throws keyword in the functions declaration after its params.

func canThrowErrors() throws -> Void {}
func cannotThrowErrors() -> Void {}

// A throwing function propagates errors that are thrown inside of it to the scope from which it is called.

// *** NOTE: -> Only THROWING FUNCTIONS CAN PROPOGATE ERRORS. ANY ERRORS THROWN INSIDE A NON-THROWING FUNCTION MUST BE HANDLED INSIDE THE FUNCTION

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 100, count: 7),
        "Chocolate Chip Cookies": Item(price: 150, count: 3),
        "Pepsi": Item(price: 200, count: 5),
    ]
    var coinsDeposited: Int = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let someSnacks = [
    "Alice": "Chips",
    "Bob": "Chocolate Chip Cookies",
    "Ray": "Cake",
]

func buySnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = someSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

// in this example, the 'buySnack' function looks up a given persons favorite snack and tries to buy it for them by calling the 'vend' method. Becuase vend method can throw an error, its called with the 'try' keyword in front of it.


