//
//  operators.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/18/25.
//

// ternary operater -> takes three parts which takes the form 'question ? answer1 : answer2'
let contentHeight = 40;
let hasHeader = true;
let rowHeight = contentHeight + (hasHeader ? 50 : 20);
// rowHeight now equals 90


// nil-coalescing
let defaultColorName = "red";
var userDefaultColorName: String?;
var colorNameToUse = userDefaultColorName ?? defaultColorName;
// userDefaultColorName is nil, so colorName is set to the default of 'red' -> if it wasnt nil, it wouldve been set to that color instead

func loopControl(_ start: Int, _ end: Int) -> Int {
    for index in start...end {
        return "\(index) times 5 is \(index * 5)";
    }
}


