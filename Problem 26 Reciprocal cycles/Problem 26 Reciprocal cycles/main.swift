//
//  main.swift
//  Problem 26 Reciprocal cycles
//
//  Created by Jaakko Kenttä on 25/09/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

import Foundation

/*
Lets generate 1/7 decimals:

1 / 7 = 0
1 	% 7 * 10 / 7	= 	10 / 7 	= 1
10 	% 7 * 10 / 7	=	30 / 7 	= 4
30 	% 7 * 10 / 7	=	20 / 7 	= 2
20 	% 7 * 10 / 7	= 	60 / 7 	= 8
60 	% 7	* 10 / 7	= 	40 / 7 	= 5
40 	% 7 * 10 / 7	= 	50 / 7 	= 7
50 	% 7 * 10 / 7	= 	10 / 7 	= 1 <- starts repeating itself

so the decimals are 0.1428571...
*/

@discardableResult
func decimalExpansion(numerator: Int, denominator: Int) -> [Int] {

	var changingNumerator = numerator

	var goneNumerators = [changingNumerator]
	var digitsFound = [Int]()

	for _ in 0 ... 8 {


		let digit = changingNumerator / denominator
//		print("\(changingNumerator)/\(denominator)=\(digit)")
		digitsFound.append(digit)

		changingNumerator = changingNumerator % denominator * 10;

		if goneNumerators.contains(changingNumerator) {
			break
		} else {
			goneNumerators.append(changingNumerator)
		}
	}

	print("\(numerator)/\(denominator) = \(digitsFound)")
	return digitsFound
}

decimalExpansion(numerator: 1, denominator: 7)


/*
var recurringDecimals: [Int : [Int]] = [:]

for i in 1 ... 1000 {
	let expansion = decimalExpansion(numerator: 1, denominator: i)

	let recurr = expansion.filter { $0 != 0 }
	recurringDecimals[i] = recurr

}


var sorted = recurringDecimals.sorted { a, b in
	return a.value.count > b.value.count
}.map { print($0)}
*/


/*
var a = 1;
var b = 14;

var digits = 10;

for _ in 0 ... digits {
	let n = a/b;
	print("\(a)/\(b) = \(n)")
	a = a % b * 10;
}
*/




/*
var denominator: Int = 7

var digits = [Int]()
var leftover = 1

print("\(1)/\(denominator) = \(Double(leftover) / Double(denominator))");

while leftover != 0 {
	var times = 1

	while Double(leftover) / Double(denominator) < 1 {
		times += 1
		leftover *= 10
	}

	// How many times it goes to denomitar
	let count = leftover / denominator
	digits.append(count)
	print(count)

	// Check if it's repeating
	// If previous integer is same, then it's repeating
	if let last = digits.last, last == count {
		digits.append(0)
		break
	}

	leftover = leftover - count * denominator
	leftover *= 10
}

print(digits)
*/

