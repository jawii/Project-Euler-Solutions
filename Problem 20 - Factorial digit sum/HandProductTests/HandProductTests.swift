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

	func testProductSums_isNilWithNoNumbers() {
		XCTAssertNil(HandProduct.calculateHandProductSums(number1: "123a", number2: "g123"))
		XCTAssertNil(HandProduct.calculateHandProductSums(number1: "", number2: "22"))
    }

	func testProductSums_withVariousValues() {
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
		expectedResult = [[3,2,2], [6,4,6,0]]
		result = HandProduct.calculateHandProductSums(number1: number1, number2: number2)
		XCTAssert(result != nil && result! == expectedResult)
	}

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
