//
//  Interactor.swift
//  TestChallenge
//
//  Created by Prachi Dubey on 4/11/2024.
//

import Foundation

protocol BusinessLogic {
    func getFactsOfDog(from urlString: String)
}

final class Interactor: BusinessLogic {
    var presenter: PresentationLogic?
    let worker = Worker()
    var dogFacts: [String] = []
    
    func getFactsOfDog(from urlString: String) {
        let url = URL(string: urlString)!
        let decoder = JSONDecoder()
        Task {
            do {
                let data = try await worker.fetchDogsFacts(from: url)
                let dogFacts = try decoder.decode(DogFacts.self, from: data)
                self.dogFacts = dogFacts.facts
            } catch {
                print("Error - \(error.localizedDescription)")
            }
            
            presenter?.presentFactsOfDogs(with: dogFacts)
        }
    }
}
