//
//  TestChallengeUITests.swift
//  TestChallengeUITests
//
//  Created by Prachi Dubey on 3/11/2024.
//

import XCTest

final class TestChallengeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ControllerInitialization() {
        let app = XCUIApplication()
        app.launch()
        
        let tableView = app.tables["tableView"]
        let navigation = app.navigationBars
        
        XCTAssertTrue(tableView.exists)
        XCTAssertTrue(tableView.tableRows.count == 0)
        XCTAssertTrue(navigation.element.exists)
        XCTAssert(app.staticTexts["Dog Facts"].exists)
    }
    
    func test_TableView() {
        let app = XCUIApplication()
        app.launch()
        
        let tableView = app.tables["tableView"]
        let exists = NSPredicate(format: "exists == 1")
        
        let firstTableCell = tableView.cells.firstMatch
        let expectation = expectation(for: exists, evaluatedWith: firstTableCell)
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertTrue(firstTableCell.exists)
        expectation.fulfill()
        
        let cellCount = tableView.cells.count
        XCTAssert(cellCount == 10)
    }
}
