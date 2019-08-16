//
//  main.swift
//  Problem 20 - Factorial digit sum
//
//  Created by Jaakko Kenttä on 04/08/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

/*
Factorial digit sum
Problem 20
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
*/
import Foundation


extension String {
	func isNumber() -> Bool {
		for char in self {
			guard let _ = Int(String(char)) else { return false }
		}
		return true
	}
}

struct HandProduct {

	init() {
		fatalError("No Init")
	}

	/// Calculating 100! gives too big number
	/// Doing the same stuff by calculating hand:
	static func calculateNumbers(number1: String, number2: String) -> String? {

		guard var summattavat = HandProduct.calculateHandProductSums(number1: number1, number2: number2) else {
			return nil
		}

		// Add the numbers
		var theNumber = [String]()
		var sum = 0
		var addMemory = 0

		// Get the maximum length for adding the product
		let maxLen = summattavat.max { (arr1, arr2) -> Bool in
			arr1.count > arr2.count
		}!.count
		var indexPlace = maxLen


		while indexPlace >= 0 {
			for numerolista in summattavat {
				if let last = numerolista.last {
					sum += last
					print("Last was \(last)")
				}
			}
			summattavat = summattavat.map {$0.dropLast()}

			if addMemory > 0 {
				sum += addMemory
				addMemory = 0
			}

			if sum > 9 {
				// Takes ones off
				#error("Continue here")
				// 9213 -> take 3 off and add 921 to memory
				// 24 -> take 4 off and add 2 to memory 
				addMemory = Int(String(sum).suffix(1))!
				let toAdd = Int(String(sum).prefix(1))!
				theNumber.append(String(toAdd))
			} else {
				theNumber.append(String(sum))
			}

			sum = 0
			indexPlace -= 1
		}

		var returnString = String(theNumber.reversed().joined())

		// Remove leading zeros
		while returnString[returnString.startIndex] == "0" {
			returnString.remove(at: returnString.startIndex)
		}

		return returnString
	}


	/// Given two numbers of string format, returns the lower number as a string
	/// Used for very very high numbers
	static func returnLowerNumberString(number1: String, number2: String) -> String? {
		if number1 == "" || number2 == "" { return nil }
		if !number1.isNumber() || !number2.isNumber() { return nil }

		//  2123 <- higherNum
		//  *156 <- lowerNum
		//-------

		// if other number has less characters, its the the s
		if number1.count != number2.count {
			return number1.count < number2.count ? number1 : number2
		}

		// now the counts are equal so start comparing
		for (index, letter) in number1.enumerated() {
			let number1Number = Int(String(letter))!
			let num2index = number2.index(number2.startIndex, offsetBy: index)
			let number2Number = Int(String(number2[num2index]))!

			if number1Number > number2Number {
				return number2
			} else if number2Number > number1Number {
				return number1
			}
		}

		// and now they are same
		return number1
	}

	/// Returns product makers of two string numbers like in product calculating by hand
	/// Used for very big number product calculations
	static func calculateHandProductSums(number1: String, number2: String) -> [[Int]]? {

		guard let lowerNum = HandProduct.returnLowerNumberString(number1: number1, number2: number2) else { return nil }
		let higherNum = lowerNum == number1 ? number2 : number1

		var summattavat = [[Int]]()
		var memory = 0
		var place = 0

		// Go the multiplication same way you do it by hand.
		// Collect the products in array
		// This is not the correct way xD
		// Do this 1045 * 85 = 1045 * (80 + 5) = 1045 * 80 + 1045 * 5.
		// I'll leave this here so that I always memorize this.
		for number in lowerNum.reversed() {
			var summattava = Array(repeating: 0, count: place)
			place += 1

			// nil if the number1 is not number
			guard let number = Int(String(number)) else { return nil }

			for currentHigh in higherNum.reversed() {
				// nil if the number2 is not number
				guard let currentHighNum = Int(String(currentHigh)) else { return nil }

				var product = number * currentHighNum

				if memory > 0 {
					product += memory
					memory = 0
				}

				if product > 9 {
					memory = Int(String(product).prefix(1))!
					let toAdd = Int(String(product).suffix(1))!
					summattava.insert(toAdd, at: 0)
				} else {
					summattava.insert(product, at: 0)
				}

			}
			if memory > 0 {
				summattava.insert(memory, at: 0)
				memory = 0
			}

			summattavat.append(summattava)
		}
		print("Summattavat luvuille \(number1) and \(number2): \(summattavat)")
		return summattavat
	}
}




print(HandProduct.calculateHandProductSums(number1: "85", number2: "45"))


//print(HandProduct.calculateNumbers(number1: "322", number2: "21")) // 6762
//print(HandProduct.calculateNumbers(number1: "123", number2: "123")) // 15 129


//let string = "32"
//print(string.suffix(1))
//print(string.prefix(1))
















