//
//  ContentView.swift
//  ClipIt
//
//  Created by Khidr Brinkley on 12/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient Background
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea() // Covers the entire screen
                
                VStack(spacing: 30) {
                    // Welcome Text
                    Text("Welcome to Clip-It")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                    
                    // App Icon
                    Image(systemName: "scissors.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                    
                    // Navigation Button
                    NavigationLink {
                        ProductListView()
                    } label: {
                        Text("Browse Products")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.pink, Color.orange]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .cornerRadius(15)
                            )
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                    }
                    .padding(.horizontal, 40) // Adds space on the sides
                }
                .padding(.vertical, 50) // Adds spacing between elements and the screen edges
            }
        }
    }
}

#Preview {
    ContentView()
}
