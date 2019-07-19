//
//  main.swift
//  Problem 18
//
//  Created by Jaakko Kenttä on 23/06/2019.
//  Copyright © 2019 Jaakko Kenttä. All rights reserved.
//

/*
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

				3
			7 		4
		2 		4 		6
	8 		5 		9 		3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

														75
													95		64
												17 		47 		82
											18 		35 		87 		10
										20 		04 		82 		47 		65
									19 		01 		23 		75 		03 		34
								88 		02 		77 		73 		07 		63 		67
							99 		65 		04 		28 		06 		16 		70 		92
						41 		41 		26 		56 		83 		40 		80 		70		33
					41 		48 		72 		33 		47 		32 		37 		16 		94 		29
				53 		71 		44 		65 		25 		43 		91 		52 		97 		51 		14
			70 		11 		33 		28 		77 		73 		17 		78 		39 		68 		17 		57
		91 		71 		52 		38 		17 		14 		91 		43 		58 		50 		27 		29 		48
	63 		66 		04 		68 		89 		53 		67 		30 		73 		16 		69 		87 		40 		31
04 		62 		98 		27 		23 		09		 70 	98 		73 		93 		38 		53 		60 		04 		23

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)
*/

import Foundation


let TRIANGLE = """
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
"""

// Generates single integer array from the pyramid
var TRIANGLE_ARRAY = TRIANGLE
	.components(separatedBy: "\n")
	.map { $0.components(separatedBy: " ")}
	.reduce([], +)
	.compactMap { Int($0)}

enum Direction: String {
	case left = "left"
	case right = "right"

	static func generateAllPaths(ofLength length: Int) -> [[Direction]] {

		var paths: [[Direction]] = []

		// https://www.geeksforgeeks.org/generate-all-the-binary-strings-of-n-bits/
		func generateAllBinaryStrings(n: Int, array: [Direction], i: Int) {
			if i == n {
				paths.append(array)
				return
			}

			var arrayCopy = array
			arrayCopy[i] = .left
			generateAllBinaryStrings(n: n, array: arrayCopy, i: i + 1)

			arrayCopy[i] = .right
			generateAllBinaryStrings(n: n, array: arrayCopy, i: i + 1)
		}

		generateAllBinaryStrings(n: length, array: Array.init(repeating: .left, count: length), i: 0)

		return paths
	}
}

extension Direction: CustomStringConvertible {
	var description: String {
		if self == .left {
			return "L"
		} else {
			return "R"
		}
	}
}

class Path {
	var triangleArray: [Int]
	var directions: [Direction]

	init(directions: [Direction], array: [Int]) {
		self.directions = directions
		self.triangleArray = array
	}

	var value: Int {
		// Go through directions selecting the next item from the array
		// In each level the array has one more item (level)
		// Keep track of index
		var currentDirection: Direction
		var level = 0
		var value = triangleArray[0]
		var currentIndex = 0

		while !directions.isEmpty {
			currentDirection = directions.remove(at: 0) // not efficient

			let toAdd = currentDirection == .left ? 1 : 2
			currentIndex += level + toAdd

			let valueToAdd = triangleArray[currentIndex]

			value += valueToAdd
			level += 1
		}

		return value
	}
}


/// Calculate max path from top to down. Works only pyramids with positive integers
@discardableResult func calculateMaxPath(pyramidArray: [Int]) -> Int {
	// TODO: calculate pyramid height
	let pyramidHeight = 14

	// generate all paths
	let allDirections = Direction.generateAllPaths(ofLength: pyramidHeight)
	print("Path count: \(allDirections.count)")

	var maxValue = 0
	var maxPathDirections = [Direction]()

	// calculate max value
	for directions in allDirections {
		let path = Path(directions: directions, array: pyramidArray)
		let pathValue = path.value

		if pathValue >= maxValue {
			maxValue = pathValue
			maxPathDirections = directions
		}
	}
	print("Maximum value: \(maxValue)")
	print("Max value provided by directions:\n \(maxPathDirections)")

	return maxValue
}

calculateMaxPath(pyramidArray: TRIANGLE_ARRAY)


