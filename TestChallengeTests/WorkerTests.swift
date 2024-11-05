//
//  WorkerTests.swift
//  TestChallengeTests
//
//  Created by Prachi Dubey on 5/11/2024.
//

import XCTest
@testable import TestChallenge

final class WorkerTests: XCTestCase {
    var worker: Worker?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        worker = Worker()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        worker = nil
    }
    
    func test_fetchDogsFacts() async throws {
        let url = URL(string: Constants.dogUrl)!
        let data = try await worker?.fetchDogsFacts(from: url)
        XCTAssertNotNil(data)
    }
}
