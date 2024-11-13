//
//  HomeView.swift
//  Globoplay
//
//  Created by Myllene Silva on 11/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if searchText.isEmpty {
                    if viewModel.movies.isEmpty {
                        Text("No Results")
                    } else {
                        VStack {
                            HStack {
                                Text("Filmes")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            .padding(.horizontal)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(viewModel.movies) { movie in
                                        NavigationLink {
                                            MovieDetailView(movie: movie)
                                        } label: {
                                            MovieCard(movieItem: movie)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                            Spacer()
                        }
                    }
                } else {
                    LazyVStack {
                        ForEach(viewModel.searchResults) { movie in
                            HStack {
                                AsyncImage(url: movie.backdropURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 120)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 80, height: 120)
                                }
                                .clipped()
                                .cornerRadius(10)
                                
                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(.black)
                            .cornerRadius(20)
                            .padding()
                        }
                    }
                }
            }
            .background(Color.backgroundColor)
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { _, newValue in
            if newValue.count > 2 {
                viewModel.fetchSearch(title: newValue)
            }
        }
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}

#Preview {
    HomeView()
}

struct MovieCard: View {
    let movieItem: MovieModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: movieItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 200)
            } placeholder: {
                Rectangle().fill(.gray)
                    .frame(width: 170, height: 200)
            }
            HStack {
                Text(movieItem.title)
                    .foregroundStyle(.white)
                    .fontWeight(.heavy)
            }
            .padding()
            .frame(width: 170)
            .background(.black)
        }
        .cornerRadius(10)
        .frame(width: 170, height: 500)
    }
}

