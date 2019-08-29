//
//  PrimeHelpers.swift
//  Problem 21 Amicable Numbers
//
//  Created by Jaakko Kenttä on 19/08/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

import Foundation

// Primes
public func getAllPrimesBelow(number maxNumber: Int) -> [Int] {
	guard maxNumber >= 2 else { return [] }

	var primeSieve = [Bool].init(repeating: true, count: maxNumber)
	primeSieve[0] = false // Remove 0
	primeSieve[1] = false // Remove 1

	for number in 2 ..< maxNumber {
		if primeSieve[number] == true {
			for multiple in stride(from: number * number, to: primeSieve.count, by: number) {
				primeSieve[multiple] = false
			}
		}
	}

	let primes: [Int] = primeSieve.enumerated().compactMap { $1 == true ? $0 : nil }

	return primes
}
