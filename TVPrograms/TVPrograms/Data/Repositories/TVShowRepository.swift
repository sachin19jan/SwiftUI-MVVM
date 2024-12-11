//
//  TVShowRepository.swift
//  TVProgrammes
//
//  Created by JEEVAN TIWARI on 02/12/24.
//


protocol TVShowRepository {
    func fetchPopularTVShows() async throws -> [TVShow]
    func fetchTVShowDetails(id: Int) async throws -> TVShowDetails
}