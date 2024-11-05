//
//  MockInteractor.swift
//  TestChallengeTests
//
//  Created by Prachi Dubey on 4/11/2024.
//

import Foundation
@testable import TestChallenge

final class MockInteractor: BusinessLogic {
    var urlString: String = ""
    var isInteractorCalled: Bool = false
    
    func getFactsOfDog(from urlString: String) {
        self.urlString = urlString
        isInteractorCalled = true
    }
}
