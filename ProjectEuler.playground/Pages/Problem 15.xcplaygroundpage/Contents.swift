import Foundation

// Problem 15

/*
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20×20 grid?
*/

// By drawing it can bee noticed that it seems to take same amount of steps every time.
// In 2x2 grid it's 4 steps and you are in bottom right corner
// In 3x3 grid it's 6 steps
// In 4x4 grid it's 8 steps
// In 5x5 grid it's 10 steps
// .
// .
// .
// In 20 x 20x it's 40 steps

// In every route there is exactly same amount of lefts and downs
// 2x2 = LLDD, LDLD, LDDL, DLLD, DLDL, DDLL
// The question is:
// How many different lines can be constructed with two objects whose count is same.



// So in 20 x 20 grid there are 20 lefts and 20 downs






