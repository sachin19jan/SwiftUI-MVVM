//
//  APIClient.swift
//  TVProgrammes
//
//  Created by JEEVAN TIWARI on 02/12/24.
//

import Foundation

final class APIClient {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = endpoint.method.rawValue
        // Add headers if needed, e.g., urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // Ensure the response is an HTTP response
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        // Decode the data
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
