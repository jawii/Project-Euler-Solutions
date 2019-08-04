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


// Calculating 100! gives too big number
// Doing the same stuff by calculating hand:
func calculateNumbers(number1: String, number2: String) -> String {
	// Take smaller (by length)
	let kertojat = number1.count < number2.count ? number1 : number2
	let kerrottavat = kertojat == number1 ? number2 : number1
	print("Kertoja: \(kertojat)")
	print("Kerrottavat: \(kerrottavat)")

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
	debugPrint(summattavat)

	// Add the numbers
	var theNumber = [String]()
	var product = 0

	var addMemory = 0

	// Get the maximum length for adding the product
	let maxLen = summattavat.max { (arr1, arr2) -> Bool in
		arr1.count > arr2.count
	}!.count
	var indexPlace = maxLen

	#error("Some here is making problems")
	while indexPlace >= 0 {
		for numerolista in summattavat {
			print("Product is: \(product)")
			if indexPlace < numerolista.count {
				print("Adding the number: \(numerolista[0])")
				product += numerolista[0]
			}
		}
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
	print("Calculated number:", theNumber)

	return ""
}

calculateNumbers(number1: "322", number2: "21")

//var numbers = " "
//for i in 1 ... 100 {
//	numbers.append("\(i)\t")
//	if i % 10 == 0 {
//		numbers.append("\n")
//	}
//}
//print(numbers)


//let string = "32"
//print(string.suffix(1))
//print(string.prefix(1))
















