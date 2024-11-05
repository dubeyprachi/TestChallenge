//
//  Worker.swift
//  TestChallenge
//
//  Created by Prachi Dubey on 4/11/2024.
//

import Foundation

final class Worker {
    //This class handles the logic to make webservice calls
    
    func fetchDogsFacts(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
