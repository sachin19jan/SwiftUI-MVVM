//
//  PopularShowsViewModel.swift
//  TVProgrammes
//
//  Created by JEEVAN TIWARI on 02/12/24.
//

import SwiftUI
final class PopularShowsViewModel: ObservableObject {
    @Published var shows: [TVShow] = []

    private let getPopularTVShowsUseCase: GetPopularTVShowsUseCaseProtocol

    init(getPopularTVShowsUseCase: GetPopularTVShowsUseCaseProtocol = GetPopularTVShowsUseCase()) {
        self.getPopularTVShowsUseCase = getPopularTVShowsUseCase
    }

    func loadPopularShows() {
        Task {
            do {
                shows = try await getPopularTVShowsUseCase.execute()
            } catch {
                print("Error loading shows: \(error)")
            }
        }
    }
}
