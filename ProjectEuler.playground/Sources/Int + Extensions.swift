import Foundation

extension Int {
	
	/// Calculate factors, not so efficient
	public func calculateFactors() -> [Int] {
		return (1...self).filter { self & $0 == 0 }
	}
	
	/// Returns 1 * 2 * 3 * ... * self
	public func factorial() -> Int {
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
