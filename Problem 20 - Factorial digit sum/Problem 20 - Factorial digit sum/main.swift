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

struct HandProduct {

	init() {
		fatalError("No Init")
	}

	// Calculating 100! gives too big number
	// Doing the same stuff by calculating hand:
	static func calculateNumbers(number1: String, number2: String) -> String {
		// Take smaller (by length)
		let kertojat = number1.count < number2.count ? number1 : number2
		let kerrottavat = kertojat == number1 ? number2 : number1
	//	print("Kertoja: \(kertojat)")
	//	print("Kerrottavat: \(kerrottavat)")

		var summattavat = [[Int]]()
		var memory = 0
		var place = 0

		// Go the multiplication same way you do it by hand
		// Collect the products in array
		#warning("Refactor naming and separate")
		for kertoja in kertojat.reversed() {

			var summattava = Array(repeating: 0, count: place)
			place += 1

			let number = Int(String(kertoja))!

			for kerrottava in kerrottavat.reversed() {
				var number2 = Int(String(kerrottava))!

				if memory > 0 {
					number2 += memory
					memory = 0
				}

				let product = number * number2
				if product > 9 {
					memory = Int(String(product).suffix(1))!
					let toAdd = Int(String(product).prefix(1))!
					summattava.insert(toAdd, at: 0)
				} else {
					summattava.insert(product, at: 0)
				}
			}
			summattavat.append(summattava)
		}
		debugPrint("Summattavat", summattavat)

		// Add the numbers
		var theNumber = [String]()
		var product = 0
		var addMemory = 0

		// Get the maximum length for adding the product
		let maxLen = summattavat.max { (arr1, arr2) -> Bool in
			arr1.count > arr2.count
		}!.count
		var indexPlace = maxLen


		while indexPlace >= 0 {
			for numerolista in summattavat {
				if let last = numerolista.last {
					product += last
				}
			}
			summattavat = summattavat.map {$0.dropLast()}

			if addMemory > 0 {
				product += addMemory
				addMemory = 0
			}

			if product > 9 {
				addMemory = Int(String(product).suffix(1))!
				let toAdd = Int(String(product).prefix(1))!
				theNumber.append(String(toAdd))
			} else {
				theNumber.append(String(product))
			}

			product = 0
			indexPlace -= 1
		}

		return String(theNumber.reversed().joined())
	}


	/// Returns product makers of two string numbers like in product calculating by hand
	/// Used for very big number product calculations
	static func calculateHandProductSums(number1: String, number2: String) -> [[Int]]? {

		if number1 == "" || number2 == "" { return nil }
		//  2123 <- higherNum
		//  *156 <- lowerNum
		//-------
		let lowerNum = number1.count < number2.count ? number1 : number2
		let higherNum = lowerNum == number1 ? number2 : number1

		var summattavat = [[Int]]()
		var memory = 0
		var place = 0

		// Go the multiplication same way you do it by hand
		// Collect the products in array
		for number in lowerNum.reversed() {

			var summattava = Array(repeating: 0, count: place)
			place += 1

			// nil if the number1 is not number
			guard let number = Int(String(number)) else { return nil }
			for currentHigh in higherNum.reversed() {

				// nil if the number2 is not number
				guard var currentHighNum = Int(String(currentHigh)) else { return nil }

				if memory > 0 {
					currentHighNum += memory
					memory = 0
				}

				let product = number * currentHighNum
				if product > 9 {
					memory = Int(String(product).suffix(1))!
					let toAdd = Int(String(product).prefix(1))!
					summattava.insert(toAdd, at: 0)
				} else {
					summattava.insert(product, at: 0)
				}
			}
			summattavat.append(summattava)
		}

		return summattavat
	}
}







print(HandProduct.calculateNumbers(number1: "322", number2: "21")) // 6762

print(HandProduct.calculateNumbers(number1: "123", number2: "123")) // 15 129


//let string = "32"
//print(string.suffix(1))
//print(string.prefix(1))
















