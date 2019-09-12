//
//  Helpers.swift
//  Problem 23 Non-abundant sums
//
//  Created by Jaakko Kenttä on 12/09/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

import Foundation

public extension Int {
	/// Calculate factors
	func calculateFactors() -> [Int] {
		let doubleSelf = Double(self)
		let squareRootOFSelf = Int(sqrt(doubleSelf).rounded(.awayFromZero))

		var returnArray = [Int]()
		for number in 1 ... squareRootOFSelf + 1 {
			if self % number == 0 {
				returnArray.append(number)
				returnArray.append(self / number)
			}
		}

		// Remove duplicates
		return Array(Set(returnArray)).sorted()
	}

	/// Number is abundant if the sum of its proper divisors exceeds n
	/// Proper divisor: factors that are less than the number
	var isAbundant: Bool {
		// drop the number
		let divisors = self.calculateFactors().dropLast()
		return divisors.reduce(0, +) > self
	}
}

extension Array where Element == Int {

	/// Array must be sorted and have only positive numbers
	func hasTwoNumbersWithSumOf(_ number: Int) -> Bool {

//		guard let first = self.first, number < first else { return true }

		for number1 in self {
			for number2 in self {
				if number1 + number2 == number {
					return true
				}
			}
		}

		return false
	}
}

