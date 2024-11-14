//
//  HomeViewModelTests.swift
//  GloboplayTests
//
//  Created by Myllene Silva on 13/11/24.
//

import XCTest
@testable import Globoplay

class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchMovies() {
        let expectation = self.expectation(description: "Fetch movies")
        viewModel.fetchMovies {_ in
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertGreaterThan(viewModel.movies.count, 0)
    }
}
