//
//  PresenterTests.swift
//  TestChallengeTests
//
//  Created by Prachi Dubey on 4/11/2024.
//

import XCTest
@testable import TestChallenge

final class PresenterTests: XCTestCase {
    var presenter: Presenter?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = Presenter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        presenter = nil
    }
    
    func test_presentFactsOfDogs_WithReturnedData() {
        let controller = MockController()
        presenter?.controller = controller
        
        let input = ["German Shepherd", "Bulldog"]
        presenter?.presentFactsOfDogs(with: input)
        
        XCTAssertNotNil(controller.facts)
        XCTAssertTrue(controller.facts.count == 2)
        XCTAssertTrue(controller.isDisplayLogicCalled)
    }
    
    func test_presentFactsOfDogs_NoData() {
        let controller = MockController()
        presenter?.controller = controller
        
        presenter?.presentFactsOfDogs(with: [])
        
        XCTAssertNotNil(controller.facts)
        XCTAssertTrue(controller.facts.isEmpty)
        XCTAssertTrue(controller.isDisplayLogicCalled)
    }

}
