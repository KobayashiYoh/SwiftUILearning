//
//  UnreasonableJankenAppTests.swift
//  UnreasonableJankenAppTests
//
//  Created by 小林陽 on 2023/04/19.
//

import XCTest
@testable import UnreasonableJankenApp

final class UnreasonableJankenAppTests: XCTestCase {
    
    let viewController = ContentView()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        XCTAssertEqual(viewController.judgeResult(yourHand: Hand.rock, cpuHand: Hand.paper), Result.draw)
        XCTAssertEqual(viewController.judgeResult(yourHand: Hand.rock, cpuHand: Hand.scissors), Result.win)
        XCTAssertEqual(viewController.judgeResult(yourHand: Hand.rock, cpuHand: Hand.paper), Result.lose)
        XCTAssertEqual(viewController.judgeResult(yourHand: Hand.scissors, cpuHand: Hand.rock), Result.lose)
        XCTAssertEqual(viewController.judgeResult(yourHand: Hand.scissors, cpuHand: Hand.scissors), Result.draw)
        XCTAssertEqual(viewController.judgeResult(yourHand: Hand.scissors, cpuHand: Hand.paper), Result.win)
        XCTAssertEqual(viewController.judgeResult(yourHand: Hand.paper, cpuHand: Hand.rock), Result.win)
        XCTAssertEqual(viewController.judgeResult(yourHand: Hand.paper, cpuHand: Hand.scissors), Result.lose)
        XCTAssertEqual(viewController.judgeResult(yourHand: Hand.paper, cpuHand: Hand.paper), Result.draw)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
