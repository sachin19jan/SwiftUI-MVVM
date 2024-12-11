//
//  PopularShowsView.swift
//  TVProgrammes
//
//  Created by JEEVAN TIWARI on 02/12/24.
//

import SwiftUI

struct PopularShowsView: View {
    @StateObject private var viewModel = PopularShowsViewModel()

    public var body: some View {
        NavigationView {
            List(viewModel.shows, id: \.id) { show in
                NavigationLink(destination: DetailsView(viewModel: TVShowDetailsViewModel(id: show.id))) {
                    Text(show.name)
                }
            }
            .onAppear {
                Task {
                    viewModel.loadPopularShows()
                }
            }
        }
    }
}

