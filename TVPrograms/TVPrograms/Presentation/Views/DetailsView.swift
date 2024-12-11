//
//  DetailsView.swift
//  TVProgrammes
//
//  Created by JEEVAN TIWARI on 02/12/24.
//

import SwiftUI
struct DetailsView: View {
    @StateObject private var viewModel: TVShowDetailsViewModel

    init(viewModel: TVShowDetailsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            if let details = viewModel.details {
                Text(details.name)
                    .font(.headline)
                    .padding(.bottom, 20)
                Text(details.overview)
            } else {
                Text("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }.onAppear() {
            Task {
                await viewModel.loadDetails(id: viewModel.showID)
            }
        }
    }
}
