// Problem 7 10001st Prime

/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

// Reference article https://primes.utm.edu/howmany.html
// pi(x) tells how many prime numbers are below x (integer)
// Legendre:
//pi(x) is approximately x/(log x - 1.08366)

// x / (log x - 1.08366) = a converts to (Wolfram Alpha)
// x = -a W(-2.95547/a) // w(z) is product log function

// Using 10001 for a, we get
let max = 104769
let primes = getAllPrimesBelow(number: max)
print(primes[10000])


