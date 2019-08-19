//
//  HandProductTests.swift
//  HandProductTests
//
//  Created by Jaakko Kenttä on 11/08/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

import XCTest

class HandProductTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	// MARK: Test HandProduct returnLowerNumberString
	func test_higherNumber_whenGivenDifferentNumberOfLetters() {
		var number1 = "2"
		var number2 = "12"
		var expectedResult = "2"
		var result = HandProduct.returnLowerNumberString(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)

		number1 = "12"
		number2 = "2"
		expectedResult = "2"
		result = HandProduct.returnLowerNumberString(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)

		number1 = "12312"
		number2 = "444"
		expectedResult = "444"
		result = HandProduct.returnLowerNumberString(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)
	}

	func test_lowerNumber_whenGivenSameAmountOfLetters() {
		var number1 = "22"
		var number2 = "32"
		var expectedResult = "22"
		var result = HandProduct.returnLowerNumberString(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)

		number1 = "32"
		number2 = "22"
		expectedResult = "22"
		result = HandProduct.returnLowerNumberString(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)


		number1 = "3222"
		number2 = "3221"
		expectedResult = "3221"
		result = HandProduct.returnLowerNumberString(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)

		number1 = "3221"
		number2 = "3222"
		expectedResult = "3221"
		result = HandProduct.returnLowerNumberString(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)
	}

	func testProductSums_isNilWithNoNumbers() {
		XCTAssertNil(HandProduct.calculateHandProductSums(number1: "123a", number2: "g123"))
		XCTAssertNil(HandProduct.calculateHandProductSums(number1: "", number2: "22"))
    }

	func testProductSums_withVariousSimpleValues() {
		var number1 = "1"
		var number2 = "1"
		var expectedResult = [[1]]
		var result = HandProduct.calculateHandProductSums(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)

		number1 = "10"
		number2 = "1"
		expectedResult = [[1,0]]
		result = HandProduct.calculateHandProductSums(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)

		number1 = "322"
		number2 = "21"
		expectedResult = [[3,2,2], [6,4,4,0]]
		guard let result1 = HandProduct.calculateHandProductSums(number1: number1, number2: number2) else {
			XCTFail()
			return
		}
		XCTAssert(result1 == expectedResult, "Returned \(result1)")

		number1 = "123"
		number2 = "123"
		expectedResult = [[3, 6, 9], [2, 4, 6, 0], [1, 2, 3, 0, 0]]
		result = HandProduct.calculateHandProductSums(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)

		number1 = "32"
		number2 = "1"
		expectedResult = [[3, 2]]
		result = HandProduct.calculateHandProductSums(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)
	}

	func test_prodcutsSums_whenGivenAdvancedValues1() {
		let number2 = "45"
		let number1 = "85"
		let expectedResult = [[4, 2, 5], [3, 4, 0, 0]]
		let result = HandProduct.calculateHandProductSums(number1: number1, number2: number2)
		XCTAssert(result == expectedResult, "Returned \(result!)")
	}

	func test_prodcutsSums_whenGivenAdvancedValues2() {
		let number2 = "1045"
		let number1 = "85"
		let expectedResult = [[5, 2, 2, 5], [8, 3, 6, 0, 0]]
		let result = HandProduct.calculateHandProductSums(number1: number1, number2: number2)
		XCTAssert(result == expectedResult, "Returned \(result!)")
	}

	// MARK: - Calculate Numbers Tests

	func test_casesForNoAdding() {
		var number1 = "23"
		var number2 = "12"
		var expectedResult = "276"
		var result = HandProduct.calculateNumbers(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)

		number1 = "1"
		number2 = "32"
		expectedResult = "32"
		result = HandProduct.calculateNumbers(number1: number1, number2: number2)
		XCTAssert(result == expectedResult, "Result was \(result!)")
	}

	func test_casesWithAdding() {
		let number1 = "45"
		let number2 = "85"
		let expectedResult = "3825"
		let result = HandProduct.calculateNumbers(number1: number1, number2: number2)
		XCTAssert(result == expectedResult)
	}

	func test_advancedCases1() {
		let number1 = "423"
		let number2 = "543"
		let expectedResult = "229689"
		let result = HandProduct.calculateNumbers(number1: number1, number2: number2)
		XCTAssert(result == expectedResult, "Result was \(result!)")
	}


	func test_advancedCases2() {
		let number1 = "9876"
		let number2 = "1234"
		let expectedResult = "12186984"
		let result = HandProduct.calculateNumbers(number1: number1, number2: number2)
		XCTAssert(result == expectedResult, "Result was \(result!)")
	}


	func test_advancedCases3() {
		let number1 = "98765"
		let number2 = "12345"
		let expectedResult = "1219253925"
		let result = HandProduct.calculateNumbers(number1: number1, number2: number2)
		XCTAssert(result == expectedResult, "Result was \(result!)")
	}

}
