//
//  Tasks.swift
//  CodeChallenge
//
//  Created by Mohamed Elhamoly on 12/23/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//

import Foundation
class Tasks{
    // MARK: Q1: Add arithmetic operators (add, subtract, multiply, divide) to make the following expressions true. You can use any parentheses you’d like. 2.25 4.50 1.25 5 = 27
    var result = (2.25 + 4.5) * (5 / 1.25)
}

//MARK: Q2: Write a method to determine whether two strings are anagrams or not (examples of anagrams: debit card/bad credit, punishments/nine thumps, etc.) refrain from using ordinary loops, please base your solution completely on Higher-order functions

extension Tasks {
    func checkForAnagram(firstString: String, secondString: String) -> Bool {
        guard firstString.count == secondString.count else { return false }
        let first = Array(firstString.lowercased())
        let seconed = Array(secondString.lowercased())
        
        // If result True The tow items is Anagram
        return first.sorted() == seconed.sorted()
    }
}


//MARK: Q3: Write a method to generate nth Fibonacci number using two different approaches

extension Tasks {
    
    // Iterative approach
    func fib_Iterative_Approache(_ n: Int) -> Int {
        var fibs: [Int] = [1, 1]
        (2...n).forEach { i in
            fibs.append(fibs[i - 1] + fibs[i - 2])
        }
        return fibs.last!
    }
    
    //  Recursive approach
    func fib_Recursive_Approache(_ n: Int) -> Int {
        guard n > 2 else { return n }
        return fib_Recursive_Approache(n-1) + fib_Recursive_Approache(n-2)
    }
}
