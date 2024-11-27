//
//  FavoritesViewModel.swift
//  Globoplay
//
//  Created by Myllene Silva on 12/11/24.
//

import SwiftUI
import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [MovieModel] = []
    private let favoritesKey = "fav_key"
    
    init() {
        self.favorites = loadFavorites()
    }
    
    func loadFavorites() -> [MovieModel] {
        if let savedFavorites = UserDefaults.standard.data(forKey: "favorites") {
            let decoder = JSONDecoder()
            if let loadedFavorites = try? decoder.decode([MovieModel].self, from: savedFavorites) {
                return loadedFavorites
            }
        }
        return []
    }
    
    func saveFavorites() {
        do {
            let data = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        } catch {
            print("Erro ao salvar favoritos: \(error)")
        }
    }
    
    func addFavorite(movie: MovieModel) {
        if !favorites.contains(where: { $0.id == movie.id }) {
            favorites.append(movie)
            saveFavorites()
        }
    }
    
    func removeFavorite(movie: MovieModel) {
        if let index = favorites.firstIndex(of: movie) {
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    func isFavorite(movie: MovieModel) -> Bool {
        return favorites.contains(where: { $0.id == movie.id })
    }
}