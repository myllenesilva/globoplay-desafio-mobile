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
    
    func fetchMovies() {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=fe4342cb5f88eca24f7e27f45a7ea3c3"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let movies = try JSONDecoder().decode(MoviesResponse.self, from: data)
                self.movies = movies.results
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchSearch(title: String) {
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=fe4342cb5f88eca24f7e27f45a7ea3c3&page=1&include_adult=false&query=\(title)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in       
            guard let data else { return }
            
            do {
                let movies = try JSONDecoder().decode(MoviesResponse.self, from: data)
                self.searchResults = movies.results
            } catch {
                print(error)
            }
        }.resume()
    }
}
