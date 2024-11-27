//
//  HomeView.swift
//  Globoplay
//
//  Created by Myllene Silva on 11/11/24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("Favorites")
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                if viewModel.favorites.isEmpty {
                    Text("No Results")
                        .foregroundColor(.white)
                        .padding()
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.favorites) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    MovieCard(movieItem: movie)
                                }
                            }
                            .padding(.horizontal)
                        }
                        Spacer()
                    }
                }
            }
            .background(Color.backgroundColor)
        }
        .toolbar(.visible, for: .tabBar)
    }
}