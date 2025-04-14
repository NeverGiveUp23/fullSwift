//
//  properties.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/27/25.
//

// properties associate values with a particular class, struct, or enum.
// Stored properties store constant and variable values as part of an instance.

// Stored properties are provided only by classes and structures


// STORED Properties -> stored as an instance of a class or structure

struct FixedLength {
    var firstValue: Int
    let length: Int
}

var rangeOfItems = FixedLength(firstValue: 0, length: 3);
// the range represents integer values 0, 1, and 2

// Lazy stored properties are useful when the initial value for a property is dependent on outside factors whose values arent known until after an instances initialization is complete
class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}


let manager = DataManager();


