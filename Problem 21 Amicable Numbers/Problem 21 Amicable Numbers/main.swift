//
//  main.swift
//  Problem 21 Amicable Numbers
//
//  Created by Jaakko Kenttä on 19/08/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

/*
Amicable numbers

Problem 21
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
*/

import Foundation

var count = 10000

// Collect sums dictionary where key is the proper divisor sums and values integer what makes that
var properSumsDict = [Int: [Int]]()
for number in 1 ..< count {
	print("Checkin number: \(number)")
	let divisors = number.calculateFactors().dropLast() // drop the number itself
	let divisorsSum = divisors.reduce(0, +)

	if let _ = properSumsDict[divisorsSum] {
		properSumsDict[divisorsSum]?.append(number)
	} else {
		properSumsDict[divisorsSum] = [number]
	}
}

// Check the amicables
var amicables = [[Int]]()
for number in 0 ..< count {
	// found numbers with that sum
	guard let thatSum = properSumsDict[number] else { continue }

	// check that if any number of thatproperSumsDict has the number
	for number2 in thatSum {
		if let pairs = properSumsDict[number2], pairs.contains(number) {

			// Check that numbers are not equal
			if number2 == number { continue }

			// Check that the pair does not exist
			// For example do not appned [20, 21] if [21, 20] already is there
			// That's why the sorting
			let amicablePair = [number, number2].sorted()
 			if !amicables.contains(amicablePair) {
				amicables.append([number, number2].sorted())
			}
		}
	}
}
print("Amicables: ", amicables)
let flattened = amicables.flatMap { $0 }
let sum = flattened.reduce(0, +)
print("Sum: ", sum)



