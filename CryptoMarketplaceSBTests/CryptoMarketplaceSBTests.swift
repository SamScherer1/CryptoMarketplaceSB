//
//  CryptoMarketplaceSBTests.swift
//  CryptoMarketplaceSBTests
//
//  Created by Samuel Scherer on 1/13/23.
//

import XCTest
@testable import CryptoMarketplaceSB

final class CryptoMarketplaceSBTests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testFetchCoinsTime() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
