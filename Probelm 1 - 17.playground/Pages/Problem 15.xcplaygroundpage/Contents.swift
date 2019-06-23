import Foundation

// Problem 15

/*
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20×20 grid?
*/

//By drawing it, can be noticed that it seems to take the same amount of steps every time.
//In 2x2 grid, it's four steps, and you are in the bottom right corner
//In 3x3 grid, it's six steps
//In the 4x4 grid, it's eight steps
//In the 5x5 grid, it's ten steps
//.
//.
//.
//In 20 x 20x it's 40 steps
//
//In every route, there is the exactly the same amount of lefts and downs
//2x2 = LLDD, LDLD, LDDL, DLLD, DLDL, DDLL
//The question is:
//How many different lines can be constructed with two objects whose count is the same?
//-> how many ways we can choose, i.e. two places out of 4 possible places (order does not matter)
//-> Binomial coefficient 4C2
//-> Generic: 2nCn
//
//
//So in 20 x 20 grid, it's 40 C 20 (40 choose 20)







//
//Can't be done this way because 40! is a too big number
//let answer = calculateBinomalCoefficent(n: 40, k: 20)
//print(answer)


// In paper you can reduce 40! / (20! * 20!) = (21 * 22 * 23 * ... * 40) / 20!

//var upperProduct = 1
//for i in 21 ... 40 {
//	upperProduct *= i
//}
//print(upperProduct / 20.factorial())

//var pathNumbers: UInt64 = 1
//for i in 0 ... 20 {
//	pathNumbers *= UInt64((2 * 40) - i)
//	pathNumbers /= UInt64(i + 1)
//}
//print(pathNumbers)

10.factorial()



