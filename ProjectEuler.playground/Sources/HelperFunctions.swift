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


// Returns true if a^2 + b^2 = c^2 && a < b < c
public func checkIfPythagoranTriplet(a: Int, b: Int, c: Int) -> Bool {
	// C must be the greatest number
	guard a < b, b < c else { return false }
	
	if a * a + b * b == c * c {
		return true
	} else {
		return false
	}
	
}
