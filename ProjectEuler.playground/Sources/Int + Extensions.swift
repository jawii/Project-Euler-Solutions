import Foundation

extension Int {
	
	/// Calculate factors, not so efficiend
	func calculateFactors() -> [Int] {
		return (1...self).filter { self & $0 == 0 }
	}
}
