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

func loopControl(_ start: Int, _ end: Int) {
    for index in start...end {
        print( "\(index) times 5 is \(index * 5)");
    }
}

// for half open ranges are good for index based arrays. -> it includes the first value but not the last value -> useful to count up to but not including the length of the list
// this counts from 0 to 3 ifi have 4 in the array, so 0 - 3, not including 4
func halfRange(_ lists: [String]) {
    let count: Int = lists.count;
    for i in 0..<count {
        print("Person \(i + 1) is called \(lists[i])");
    }
}

// one side ranges -> a range that includes all the elements of an array from index 2 to the end of the array.

func oneSideRange(range: [String]) -> [String]{
    var namesIn: [String] = [];
    
    for name in range[2...] {
        namesIn.append(name);
    }
    return namesIn;
}

// another on sided range
func OneSide(range: [String]) -> [String] {
    var begin: [String] = [];
    
    for name in range[...2] {
        begin.append(name);
    }
    
    return begin;
}
// generic one sided function to list arrays
func genericOneSided<T>(_ range: [T]) -> [T] {
    var change: [T] = [];
    
    for name in range[...2] {
        change.append(name);
    }
    return change;
}
