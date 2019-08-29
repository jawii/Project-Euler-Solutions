//
//  Int+Ext.swift
//  Problem 21 Amicable Numbers
//
//  Created by Jaakko Kenttä on 19/08/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

import Foundation

public extension Int {

	/// Calculate factors, not so efficient
	func calculateFactors() -> [Int] {
		return (1 ... self).filter { self % $0 == 0 }
	}

	/// Returns 1 * 2 * 3 * ... * self
	func factorial() -> Int {
		guard self >= 0 else {
			return 0
		}

		var product = 1
		for i in 2 ... self {
			product *= i
		}
		return product
	}
}
