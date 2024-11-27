//
//  HomeView.swift
//  Globoplay
//
//  Created by Myllene Silva on 11/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @State var searchText: String = ""
    @State private var isLoading = true
    @State private var isTabBarHidden: Visibility = .visible
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            if isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                    .padding(50)
                    .foregroundColor(.white)
            } else {
                VStack {
                    HStack {
                        Text("Movies")
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    if searchText.isEmpty {
                        if homeViewModel.movies.isEmpty {
                            Text("No Results")
                                .foregroundColor(.white)
                        } else {
                            VStack {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(homeViewModel.movies) { movie in
                                            NavigationLink {
                                                MovieDetailView(movie: movie)
                                                    .environmentObject(favoritesViewModel)
                                                    .onAppear {
                                                        isTabBarHidden = .hidden
                                                    }
                                            } label: {
                                                MovieCard(movieItem: movie)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    } else {
                        List {
                            ForEach(homeViewModel.searchResults) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                        .environmentObject(favoritesViewModel)
                                } label: {
                                    HStack {
                                        Text(movie.title)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .foregroundColor(Color.backgroundColor)
                                        Spacer()
                                        Image(systemName: favoritesViewModel.isFavorite(movie: movie) ? "star.fill" : "star")
                                    }
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
                        .background(Color.backgroundColor)
                    }
                    Spacer()
                }
                .padding(.top, 20)
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { _, newValue in
            if newValue.count > 2 {
                homeViewModel.fetchSearch(title: newValue)
            }
        }
        .onAppear {
            homeViewModel.fetchMovies() { _ in
                self.isLoading = false
            }
            isTabBarHidden = .visible
        }
        .toolbar(isTabBarHidden, for: .tabBar)
    }
}