//
//  main.swift
//  Problem 24 Lexicographic permutations
//
//  Created by Jaakko Kenttä on 22/09/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

import Foundation


/*
This takes about 30 seconds
*/

var chars = "0123456789"
var permutations = [String]()

func permutation(string: String, current: String = "") {
	let length = string.count
	let strArray = Array(string)
	if (length == 0) {
		if current.count == chars.count {
			permutations.append(current)
			print(current)
		}
		return
	} else {
		// loop through every character
		for i in 0 ..< length {
			// letters before
			let left = String(strArray[0 ..< i])
			// letters after
			let right = String(strArray[i+1 ..< length])
			// combine and do again
			permutation(string: left + right, current: current +
				String(strArray[i]))
		}

	}
}


permutation(string: chars, current: "")
print(permutations.sorted()[999999])
