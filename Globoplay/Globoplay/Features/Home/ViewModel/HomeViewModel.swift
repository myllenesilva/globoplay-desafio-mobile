//
//  HomeViewModel.swift
//  Globoplay
//
//  Created by Myllene Silva on 11/11/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var movies: [MovieModel] = []
    @Published var searchResults: [MovieModel] = []
    @Published var favoritesVM = FavoritesViewModel()
    
    func fetchMovies(completion: @escaping (Result<[MovieModel], Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=fe4342cb5f88eca24f7e27f45a7ea3c3"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let moviesResponse = try JSONDecoder().decode(MoviesResponse.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.movies = moviesResponse.results
                    completion(.success(moviesResponse.results))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchSearch(title: String) {
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=fe4342cb5f88eca24f7e27f45a7ea3c3&page=1&include_adult=false&query=\(title)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            
            do {
                let moviesResponse = try JSONDecoder().decode(MoviesResponse.self, from: data)
                DispatchQueue.main.async {
                    self.searchResults = moviesResponse.results
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}