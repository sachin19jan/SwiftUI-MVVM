//
//  GetPopularTVShowsUseCaseProtocol.swift
//  TVProgrammes
//
//  Created by JEEVAN TIWARI on 02/12/24.
//


protocol GetPopularTVShowsUseCaseProtocol {
    func execute() async throws -> [TVShow]
}

final class GetPopularTVShowsUseCase: GetPopularTVShowsUseCaseProtocol {
    private let repository: TVShowRepository

    init(repository: TVShowRepository = TVShowRepositoryImpl()) {
        self.repository = repository
    }

    func execute() async throws -> [TVShow] {
        try await repository.fetchPopularTVShows()
    }
}
