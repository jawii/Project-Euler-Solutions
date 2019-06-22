import Foundation

/*
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage."
*/

// Heh, this is easy with Swift
let numbers = Array.init(1...1000).map { NSNumber(value: $0) }

let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .spellOut
numberFormatter.locale = Locale.init(identifier: "en_GB")
//numberFormatter.locale = Locale.init(identifier: "fi_FI")

var numberstrings = numbers
	.map { number in
		return numberFormatter.string(from: number)!
			.replacingOccurrences(of: "-", with: "")
			.replacingOccurrences(of: " ", with: "")
	}
	.joined(separator: "")

//print(numberstrings)
print(numberstrings.count) // 18541 NOT CORRECT

// Seems like this is not providing the AND letter
// For example
// three hundred AND forty-two (from example)
// three hundred forty-two (from our solution)

// Let's add the and words:
// "AND" - word is not in first hundred numbers
// 1000 - 99 = 901
// Not in the exact hundres (100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
// 901 - 10 = 891

// So final answer would be 18451 + 2673 = 21124

