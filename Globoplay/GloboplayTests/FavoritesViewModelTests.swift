//
//  FavoritesViewModelTests.swift
//  GloboplayTests
//
//  Created by Myllene Silva on 13/11/24.
//

import XCTest
@testable import Globoplay

class FavoritesViewModelTests: XCTestCase {

    var favoritesViewModel: FavoritesViewModel!
    var movie: MovieModel!

    override func setUp() {
        super.setUp()
        favoritesViewModel = FavoritesViewModel()
        
        movie = MovieModel(id: 1, title: "Film", posterPath: nil, backdropPath: nil, overview: "Overview", releaseDate: "01/01/2024")
    }

    override func tearDown() {
        favoritesViewModel = nil
        movie = nil
        super.tearDown()
    }

    func testAddFavorite() {
        favoritesViewModel.addFavorite(movie: movie)

        XCTAssertTrue(favoritesViewModel.isFavorite(movie: movie))
    }

    func testRemoveFavorite() {
        favoritesViewModel.addFavorite(movie: movie)
        favoritesViewModel.removeFavorite(movie: movie)

        XCTAssertFalse(favoritesViewModel.isFavorite(movie: movie))
    }
}
