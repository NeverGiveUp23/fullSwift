//
//  subscripts.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 3/1/25.
//

// subscripts allow you to query instances of a type by writing one or more values in a square brackets after the instance name

struct TimeTable {
    let multiplier: Int
    
    subscript(index: Int) -> Int {
        return multiplier * index;
    }
    
    
}

