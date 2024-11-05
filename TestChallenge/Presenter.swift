//
//  Presenter.swift
//  TestChallenge
//
//  Created by Prachi Dubey on 4/11/2024.
//

import Foundation

protocol PresentationLogic {
    func presentFactsOfDogs(with facts: [String])
}

final class Presenter: PresentationLogic {
    weak var controller: DisplayLogic?
    
    func presentFactsOfDogs(with facts: [String]) {
        controller?.displayFactsOfDog(with: facts)
    }
}
