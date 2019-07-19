import Cocoa

// Problem 2 Even Fibonacci numbers

/*

Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
*/

// Fibonacci f(n) = f(n - 2) + f(n - 1)

// f(6) = f(4) - f(5)
// f(6) = f(2) + f(3)    + f(3) + f(4)
// f(6) = ..

// This is very slow because of the recursion
func fibonacciSlow(n: Int) -> Int {
	if (n < 2) {
		return n
	}
	return fibonacciSlow(n: n - 2) + fibonacciSlow(n: n - 1)
}
fibonacciSlow(n: 10)

var fibonacciNumbers: [Int] = [1, 2]
var isOver = false
while !isOver {
	let length = fibonacciNumbers.count
	fibonacciNumbers.append(fibonacciNumbers[length - 1] + fibonacciNumbers[length - 2])
	isOver = fibonacciNumbers.last! >= 4_000_000
}

// Filter odd numbers and calculate the sum
let fibEvenSums = (fibonacciNumbers.filter { $0 % 2 == 0}).reduce(0, +)
print(fibEvenSums)

