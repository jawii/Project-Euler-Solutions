import Foundation

// Problem 9 Special Pythagorean triplet

/*
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

// a + b + c = 1000   	 	-> a < 500 	and b < 500
 // -> c = 1000 - a - b

found: for a in 0 ... 500 {
	for b in 0 ... 500 {
		let c = 1000 - a - b
		if checkIfPythagoranTriplet(a: a, b: b, c: c) {
			print(a * b * c)
			if a < b && b < c {
				break found
			}
		}
	}
}



//for a in 0 ... 500 {
//	for b in 0 ... 500 {
//		if (a * a + b * b == (1000 - a - b) * (1000 - a - b)) {
//			print(a * b * (1000 - a - b))
//		}
//	}
//}

