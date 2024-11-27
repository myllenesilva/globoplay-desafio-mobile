//
//  MovieCard.swift
//  Globoplay
//
//  Created by Myllene Silva on 13/11/24.
//

import SwiftUI

public struct MovieCard: View {
    let movieItem: MovieModel
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: movieItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 220)
                    .clipped()
            } placeholder: {
                Rectangle().fill(.gray)
                    .frame(width: 170, height: 220)
            }
        }
        .frame(width: 170, height: 220)
        .shadow(radius: 5)
    }
}
