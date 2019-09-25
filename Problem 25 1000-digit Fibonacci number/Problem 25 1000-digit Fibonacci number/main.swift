//
//  main.swift
//  Problem 25 1000-digit Fibonacci number
//
//  Created by Jaakko Kenttä on 22/09/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

import Foundation

print("Hello, World!")
// https://www.geeksforgeeks.org/sum-two-large-numbers/

infix operator ++

public extension String {
	func isNumber() -> Bool {
		for char in self {
			guard let _ = Int(String(char)) else { return false }
		}
		return true
	}

	/// Calculate two strings as they are integers
	/// Helps with very large integers
	static func ++(_ lhs: String, _ rhs: String) -> String {

		if !lhs.isNumber() || !rhs.isNumber() {
			fatalError("Can't use with non-numbers")
		}

		// Convert to array where you start popping the last element
		var lhsArr = Array(lhs)
		var rhsArr = Array(rhs)
		let count = Swift.max(lhsArr.count, rhsArr.count)

		var index = 0
		var memory = 0
		var result: [Int] = []

		while index < count {

			let num1Char = lhsArr.popLast() ?? Character("0")
			let num1 = Int(String(num1Char))!

			let num2Char = rhsArr.popLast() ?? Character("0")
			let num2 = Int(String(num2Char))!

			// Calculate sum and add memory if it's not zero
			var sum = num1 + num2
			if memory != 0 {
				sum += memory
				memory = 0
			}

			let ones: Int
			if String(sum).count > 1 {
				let prefix = String(String(sum).prefix(1))
				memory = Int(prefix)!
				ones = Int(String(String(sum).suffix(1)))!
			} else {
				ones = sum
			}

			result.append(ones)

			index += 1
		}

		if memory != 0 {
			result.append(memory)
		}

		return result
			.map { String ($0)}
			.reversed()
			.joined()
	}
}


let n = 1000
var last: String = "0"
var next: String = "1"

var index = 0
while last.count < n {
	(last, next) = (next, last ++ next)
	index += 1
	print("Calculating \(index). item")
}
print(last)
print(index)



