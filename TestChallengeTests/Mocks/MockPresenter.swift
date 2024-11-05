//
//  MockPresenter.swift
//  TestChallengeTests
//
//  Created by Prachi Dubey on 4/11/2024.
//

import Foundation
@testable import TestChallenge

final class FactsMockPresenter: PresentationLogic {
    var facts: [String] = []
    var isPresentationCalled: Bool = false
    
    func presentFactsOfDogs(with facts: [String]) {
        self.facts = facts
        isPresentationCalled = true
    }
}
