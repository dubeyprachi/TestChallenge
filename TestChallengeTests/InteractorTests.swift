//
//  InteractorTests.swift
//  TestChallengeTests
//
//  Created by Prachi Dubey on 4/11/2024.
//

import XCTest
@testable import TestChallenge

final class InteractorTests: XCTestCase {
    var interactor: Interactor?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = Interactor()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
    }
    
    func test_FactsOfDog_onSuccess_ReturnsArray() {
        let mockPresenter = FactsMockPresenter()
        interactor?.presenter = mockPresenter
        
        let urlString = "https://www.apple.com"
        interactor?.getFactsOfDog(from: urlString)
        sleep(2)
        
        XCTAssertNotNil(mockPresenter.facts)
        XCTAssertTrue(mockPresenter.isPresentationCalled)
    }
    
    func test_FactsOfDog_onError_ReturnsEmptyArray() async throws {
        
        let mockPresenter = FactsMockPresenter()
        interactor?.presenter = mockPresenter
        
        let urlString = "https://www.xyz.com"
        interactor?.getFactsOfDog(from: urlString)
        sleep(2)
        
        XCTAssert(mockPresenter.facts.isEmpty)
    }
}
