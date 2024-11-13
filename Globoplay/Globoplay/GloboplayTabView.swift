//
//  GloboplayTabView.swift
//  Globoplay
//
//  Created by Myllene Silva on 13/11/24.
//

import SwiftUI

struct GloboplayTabView: View {
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    @StateObject private var homeViewModel = HomeViewModel()

    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                    .environmentObject(homeViewModel)
                    .environmentObject(favoritesViewModel)
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            NavigationView {
                FavoritesView()
                    .environmentObject(favoritesViewModel)
            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("Favorites")
            }
        }
        .preferredColorScheme(.dark)
    }
}
