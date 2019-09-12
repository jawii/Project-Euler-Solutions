//
//  main.swift
//  Problem 21 Names scores
//
//  Created by Jaakko Kenttä on 04/09/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

import Foundation

/*
a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
*/


extension String {
	// Calculates every character alphabetical distance from letter a and returns sum of those distances
	// COLIN => C + O + L + I + N => 3 + 15 + 12 + 9 + 14 = 53
	func getAlphabeticalValue() -> Int {
		let alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		var value = 0
		for character in self.uppercased() {
			let strIndex = alphabets.firstIndex(of: character)!
			let charValue = alphabets.distance(from: alphabets.startIndex, to: strIndex) + 1
			value += charValue
		}
		return value
	}
}

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let bundleURL = URL(fileURLWithPath: "Resource.bundle", relativeTo: currentDirectoryURL)
let bundle = Bundle(url: bundleURL)
let fileUrl = bundle!.url(forResource: "p022_names", withExtension: "txt")!

let string = try! String(contentsOf: fileUrl)

let names = string
	.components(separatedBy: ",")
	.map { $0.trimmingCharacters(in: CharacterSet(charactersIn: "\"\n"))}
	.sorted()

var totalScore = 0
for (index, name) in names.enumerated() {
	let value = name.getAlphabeticalValue() * (index + 1)
	totalScore += value
}

print(totalScore)
