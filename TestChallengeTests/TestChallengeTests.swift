//
//  TestChallengeTests.swift
//  TestChallengeTests
//
//  Created by Prachi Dubey on 3/11/2024.
//

import XCTest
@testable import TestChallenge

final class TestChallengeTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func createSUT() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "MainViewController") as! ViewController

        return sut
    }
    
    func test_onLoad() {
        let controller = createSUT()
        
        controller.loadViewIfNeeded()
        
        XCTAssertNotNil(controller.tableView)
        XCTAssertNotNil(controller.interactor)
        XCTAssertNotNil(controller.presenter)
        XCTAssertNotNil(controller.router)
        XCTAssert(controller.dogFacts.isEmpty)
        XCTAssert(controller.title == "Dog Facts")
    }
    
    func test_getData() {
        let controller = createSUT()
        controller.loadViewIfNeeded()
        
        let interactor = MockInteractor()
        controller.interactor = interactor
        
        controller.getData()
        
        XCTAssertTrue(interactor.isInteractorCalled)
        XCTAssertEqual(interactor.urlString, Constants.dogUrl)
    }
}
