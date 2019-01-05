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

// Calculates the divisorcount for number
public func divisorCount(forNumber n: Int) -> Int {
	var primeFactors = [Int: Int]()
	var number = n
	
	while number % 2 == 0 {
		if let oldValue = primeFactors[2] {
			primeFactors[2] = oldValue + 1
		} else {
			primeFactors[2] = 1
		}
		number = number / 2
	}
	// Idea for this is from article (https://www.geeksforgeeks.org/print-all-prime-factors-of-a-given-number/)
	for i in stride(from: 3, to: Int(sqrt(Double(n))) + 1, by: 2) {
		while number % i == 0 {
			if let oldValue = primeFactors[i] {
				primeFactors[i] = oldValue + 1
			} else {
				primeFactors[i] = 1
			}
			number = number / i
		}
	}
	// Calculate prime divisors and their counts
	// i.e  12 = 2^2 * 3^1
	// exponents are 3 and 0
	// so divisors amount are (2 + 1)(1 + 1) = 6
	// 1 = 2^0 * 3^0
	// 2 = 2^1 * 3^0
	// 4 = 2^2 * 3^0
	// 6 = 2^1 * 3^1
	// 12 = 2^2 * 3^1
	var divisors = 1
	primeFactors.values.forEach { key in
		divisors *= (key + 1)
	}
	return divisors
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


/// Benchmarking code
public func calculateTime(forFunction function: () -> ()) -> Void {
	let start = CFAbsoluteTimeGetCurrent()
	function()
	let end = CFAbsoluteTimeGetCurrent()
	
	let diff = end - start
	print("Took \(diff) seconds")
}

