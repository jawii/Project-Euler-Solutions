// Problem 5 Smallest multiple
/*
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/


// If number is divisible by 20, it's divisible by 2, 5, 4, 10

// 1 2 3 4 5 6 7 8 9 10
// 11 12 13 14 15 16 17 18 19 20

// 1 2 3 5 7 11 13 17 19

// 1
// 2
// 3
// 4 = 2 * 2
// 5
// 6 = 2 * 3
// 7
// 8 = 2 * 2 * 2
// 9 = 3 * 3
// 10 = 2 * 5
// 11
// 12 = 2 * 2 * 3
// 13
// 14 = 2 * 7
// 15 = 3 * 5
// 16 = 2 * 2 * 2 * 2
// 17
// 18 = 2 * 3 * 3
// 19
// 20 = 2 * 2 * 5

// If number is evendly divisible by 20 it's divisible by 2, 4, 5, 10

// This does the job but it's kindly slow (30s - 60s)
let max =  11 * 12 * 13 * 14 * 15 * 16 * 17 * 18 * 19 * 20
var biggest = 1
while biggest <= max {
	biggest += 1
	if biggest % 20 != 0 { continue }
	if biggest % 19 != 0 { continue }
	if biggest % 18 != 0 { continue }
	if biggest % 17 != 0 { continue }
	if biggest % 16 != 0 { continue }
	if biggest % 15 != 0 { continue }
	if biggest % 14 != 0 { continue }
	if biggest % 13 != 0 { continue }
	if biggest % 12 != 0 { continue }
	if biggest % 11 != 0 { continue }
	
	print(biggest)
	break
}
