//
//  TVShowDetailsViewModel.swift
//  TVProgrammes
//
//  Created by JEEVAN TIWARI on 02/12/24.
//

import SwiftUI
final class TVShowDetailsViewModel: ObservableObject {
    @Published var details: TVShowDetails?
    var showID: Int = 0
    private let getTVShowDetailsUseCase: GetTVShowDetailsUseCaseProtocol

    init(id: Int, getTVShowDetailsUseCase: GetTVShowDetailsUseCaseProtocol = GetTVShowDetailsUseCase()) {
        self.showID = id
        self.getTVShowDetailsUseCase = getTVShowDetailsUseCase
    }

    func loadDetails(id: Int) async {
        do {
            details = try await getTVShowDetailsUseCase.execute(id: id)
        } catch {
            print("Error loading details: \(error)")
        }
    }
}
