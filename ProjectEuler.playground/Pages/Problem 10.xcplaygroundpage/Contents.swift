import Foundation
// Problem 10 - Summation of primes

/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

// Find all primes below and then sum them up
print(getAllPrimesBelow(number: 2_000_000).reduce(0, +))
