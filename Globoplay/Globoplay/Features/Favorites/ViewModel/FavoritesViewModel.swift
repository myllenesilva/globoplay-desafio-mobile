//
//  FavoritesViewModel.swift
//  Globoplay
//
//  Created by Myllene Silva on 12/11/24.
//

import SwiftUI
import Foundation

//class FavoritesViewModel: ObservableObject {
//    @Published var favorites: [Movie] = []
//    private let favoriteKey = "fav_key"
//    
//    init() {
//        
//    }
//    
//    func loadFavorites() {
//        if let data = UserDefaults.standard.data(forKey: favoriteKey) {
//            do {
//                let decodedFavorites = try JSONDecoder().decode([Movie].self, from: data)
//                favorites = decodedFavorites
//            } catch {
//                print("Erro ao decodificar favoritos: \(error)")
//            }
//        }
//    }
//}
