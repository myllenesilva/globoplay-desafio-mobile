//
//  SplashScreenView.swift
//  Globoplay
//
//  Created by Myllene Silva on 13/11/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                GloboplayTabView()
            } else {
                VStack {
                    Text("Globoplay")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding(.top, 20)
                }
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
