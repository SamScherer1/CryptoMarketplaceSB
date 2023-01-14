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



//    func testLaunchPerformance() {
//        // Measure the launch time
//        let start = Date()
//        app.launch()
//        let launchTime = Date().timeIntervalSince(start)
//        print("App launched in \(launchTime) seconds")
//    }

    override func setUpWithError() throws {
//        override func setUp() {
            super.setUp()
            continueAfterFailure = false
            app = XCUIApplication()
        //}
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLaunchPerformance() {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                app.launch()
            }
        }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
