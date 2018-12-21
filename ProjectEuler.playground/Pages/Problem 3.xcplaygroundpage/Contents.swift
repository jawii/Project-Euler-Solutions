
import Foundation


// Problem 3

/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

// Use of the Sieve of Eratosthenes:
// https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

//let maxNumber = 600851475143
let maxNumber = 6008


// Create array of trues
var sieve = [Bool].init(repeating: true, count: maxNumber)
// remove 0 and 1
//eSieve[0] = false
//eSieve[1] = false

// Go trough numbers and flip the multiplications to false
for number in 2 ..< maxNumber {
	if sieve[number] == true {
		for multiple in stride(from: number * number, to: sieve.count, by: number) {
			sieve[multiple] = false
		}
	}
}

// Convert trues to primes by index
var primes = [Int]()

for (index, bool) in sieve.enumerated() {
	if bool {
		primes.append(index)
	}
}

// Reverse primes and loop trough big number and find largest prime
for prime in primes.reversed() {
	if maxNumber % prime == 0 {
		print(prime)
		break
	}
}


