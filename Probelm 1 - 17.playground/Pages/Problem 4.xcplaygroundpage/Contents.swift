// Problem 4

/*
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

// Highest 3-digit number is 999. Lowest is 100
extension Int {
	func isPalindrome() -> Bool {
		let stringSelf = String(self)
		return String(stringSelf.reversed()) == stringSelf
	}
}


// This start from 999 * 999 and goes down first the second number 
var largest = 0
var a = 999
var b = 999
while a >= 100 {
	b = 999
	while b >= a {
		if a * b < largest { // skip check if lower than largest
			break
		}
		if (a * b).isPalindrome() {
			largest = (a * b)
		}
		b -= 1
	}
	a -= 1
}
print(largest)


// This works but its not so efficient
func findPalindromeBrute() {
	var highest = 0
	for number1 in 100 ... 999 {
		for number2 in 100 ... 999 {
			let product = number1 * number2
			if product.isPalindrome() {
				highest = max(product, highest)
			}
		}
	}
	print(highest)
}
