//
//  basics.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 2/12/25.
//
// common fundamental data types

var age: Int = 1; // Integer
var float: Double = 33.8; // floating point values
var test: String = "Hello World"; // for text values
var bool: Bool = true; // for boolean value

// the 'var' keyword is a changable value
// whereas a constant value needs to be declared with the 'let' keyword

let maximumNumberOfLoginAttempts = 5; // let allows this variable's value to NOT CHANGE -> in this case we do not want this value to change since it pertains to login attempts
var currentLoginAttempts = 0; // var allows this variable's value TO CHANGE -> in this case it needs to change if the login attempts fail or if you need to keep track of attempts


