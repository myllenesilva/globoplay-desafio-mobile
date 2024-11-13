//
//  MovieDetailView.swift
//  Globoplay
//
//  Created by Myllene Silva on 12/11/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: MovieModel
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: movie.backdropURL) { image in
                    image
                        .resizable()
                        .frame(height: 450)
                        .blur(radius: 10)
                } placeholder: {
                    ProgressView()
                }
                Spacer()
            }
            .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ZStack {
                        Spacer()
                            .frame(height: 10)
                        AsyncImage(url: movie.backdropURL) { image in
                            image
                                .resizable()
                                .frame(width: 170, height: 225) // Tamanho da imagem principal
                                .shadow(radius: 10)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .frame(maxWidth: .infinity)

                    Text(movie.title)
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .padding(.top, 8)
                    
                    Text("Movie")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.light)
                    
                    Text(movie.overview)
                        .foregroundColor(Color.detailtColor)
                        .padding(.horizontal)
                        .lineLimit(3)
                        .truncationMode(.tail)
                    
                    HStack(spacing: 16) {
                        Button(action: {
                        }) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Play")
                            }
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                        }
                        
                        Button(action: {
                            // Ação para "Minha lista"
                        }) {
                            HStack {
                                Image(systemName: "star.fill")
                                Text("My list")
                            }
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                    }
                    VStack(spacing: 16) {
                        HStack {
                            Text("Overview:")
                                .font(.title3)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        
                        Text(movie.overview+movie.overview)
                            .foregroundColor(Color.detailtColor)
                            .padding(.horizontal)
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                    .padding()
                    .background(Color.backgroundColor)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                    
                    Spacer()
                }
                .padding(.top, 16)
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}
