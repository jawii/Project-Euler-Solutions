import Foundation
/*
215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
*/

// No luck here ...
// 2^1000 = 2 * 2 * ... * 2
// = 4 * 4 * 4 * ... * 4 = 4^500
// = 8 * 8 * 8 * .. * 8 = 8^250
// = 64 * 64 * ... * 64 = 64 ^ 124 * 64
// = 4096 ^ 62 * 64


// Brute Force
/*
var start: UInt = 2
var count = 1

while count <= 1000 {
	start *= 2
	count += 1
	print(start)
}*/


//var result = pow(2, 100) // 1267650600228229401496703205376

//

// Construct the number as array and calculate product same way you do by hand
var start = [2]
var exponent = 1000
var count = 1
while count < exponent  {

	var index = start.count - 1
	var memory = 0

	while true {
		let number = start[index] * 2 + memory
		// This will not work if the radix is over than 3
		// because 2 * anyinteger is always less than 20 (max 2*9 = 18)
		// so the memory will be always 0 or 1
		if number >= 10 {
			start[index] = number - 10
			if index - 1 >= 0 {
				memory = 1
//				start[index - 1] += 1
			} else {
				start.insert(1, at: 0)
			}
		} else {
			start[index] = number
			memory = 0
		}

		if index <= 0 { break }

		index -= 1

	}

	count += 1
}
print(start)
// Get the number 
print(start.reduce(0, +))



