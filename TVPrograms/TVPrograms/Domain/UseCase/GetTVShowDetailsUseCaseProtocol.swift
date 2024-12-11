//
//  GetTVShowDetailsUseCaseProtocol.swift
//  TVProgrammes
//
//  Created by JEEVAN TIWARI on 02/12/24.
//


protocol GetTVShowDetailsUseCaseProtocol {
    func execute(id: Int) async throws -> TVShowDetails
}

final class GetTVShowDetailsUseCase: GetTVShowDetailsUseCaseProtocol {
    private let repository: TVShowRepository

    init(repository: TVShowRepository = TVShowRepositoryImpl()) {
        self.repository = repository
    }

    func execute(id: Int) async throws -> TVShowDetails {
        try await repository.fetchTVShowDetails(id: id)
    }
}
