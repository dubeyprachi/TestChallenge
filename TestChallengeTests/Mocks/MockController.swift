//
//  MockController.swift
//  TestChallengeTests
//
//  Created by Prachi Dubey on 4/11/2024.
//

import Foundation
@testable import TestChallenge

final class MockController: DisplayLogic {
    var facts: [String] = []
    var isDisplayLogicCalled: Bool = false
    
    func displayFactsOfDog(with facts: [String]) {
        self.facts = facts
        isDisplayLogicCalled = true
    }
}
