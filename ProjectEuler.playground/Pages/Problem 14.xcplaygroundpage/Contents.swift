import Foundation

// Problem 14 - Longest Collatz Sequence

/*
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

*/

// 12 even 12 / 2
// 6 even 6 / 2
// 3 odd 3*3 + 1
// 9

// Create lookuptable for numbers (does not fasten very much the code)
var chainLookUpTable: [Int: Int] = [:]

func getCollatzSequenceLength(forNumber n: Int) -> Int {

	var chainCount = 0
	var number = n
	
	while number != 1 {
		
		if let count = chainLookUpTable[number] {
			chainCount += count
			break
		}
		
		if number % 2 == 0 {
			number = number / 2
		} else {
			number = 3 * number + 1
		}
		chainCount += 1
	}
	
	chainLookUpTable[n] = chainCount
	
	return chainCount
}


var numberWithLongestChain = 1
var maxChainCount = 0

// Kindy brute force approach but works :>
for num in 1 ... 1_000_000 {
	
	let chainCount = getCollatzSequenceLength(forNumber: num)
	
	if chainCount > maxChainCount {
		maxChainCount = chainCount
		numberWithLongestChain = num
	}
}

print("Longest chain \(maxChainCount) is with number \(numberWithLongestChain)")


// This is superslow
/*
var number = 13
var numberWithLongestChain = number
var maxChainCount = 0

for num in 1 ... 1_000 {
	
	var startNumber = num
	var chainCount = 0
	
	var number = num
	while number != 1 {
		if number % 2 == 0 {
			number = number / 2
		} else {
			number = 3 * number + 1
		}
		chainCount += 1
	}
	if chainCount > maxChainCount {
		maxChainCount = chainCount
		numberWithLongestChain = startNumber
	}
}

print("Longestchain \(maxChainCount) is with number \(numberWithLongestChain)")
*/




