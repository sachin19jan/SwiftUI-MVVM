//
//  TVShowRepositoryImpl.swift
//  TVProgrammes
//
//  Created by JEEVAN TIWARI on 02/12/24.
//


final class TVShowRepositoryImpl: TVShowRepository {
    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchPopularTVShows() async throws -> [TVShow] {
        let response: PopularShowsResponse = try await apiClient.request(endpoint: .popularShows)
        return response.results
    }

    func fetchTVShowDetails(id: Int) async throws -> TVShowDetails {
        try await apiClient.request(endpoint: .tvShowDetails(id: id))
    }
}
