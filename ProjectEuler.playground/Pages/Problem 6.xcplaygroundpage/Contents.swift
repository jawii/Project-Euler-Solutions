// Problem 6 Sum Square Difference
/*
The sum of the squares of the first ten natural numbers is,

12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

// 1 + 2 + 3 + 4 + ... + 100 = 101 * 50 = 5050
// formula (N * (N + 1)) / 2

/// Returns 1^2 + 2^2 + 3^2 + .. + number^2
func sumSquaresUpTo(number: Int) -> Int? {
	
	guard number >= 0 else { return nil }
	
	var sum = 0
	for i in 1 ... number {
		sum += i*i
	}
	
	return sum
}

/// Returns (1 + 2 + 3 + ... + number)^2
func squareSumsUpTo(number: Int) -> Int? {
	guard number >= 0 else { return nil}
	
	let sum = (number * (number + 1)) / 2
	return sum * sum
}

squareSumsUpTo(number: 100)! - sumSquaresUpTo(number: 100)!




