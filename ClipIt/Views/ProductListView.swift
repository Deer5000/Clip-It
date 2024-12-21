//
//  ProductListView.swift
//  ClipIt
//
//  Created by Khidr Brinkley on 12/21/24.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel = ProductViewModel()
    @State private var favoritedItems: [ProductElement] = [] // Tracks all favorited items
    
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
                
                VStack(spacing: 10) {
                    // Header with Navigation Button
                    HStack {
                        Text("Featured Items")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                        
                        Spacer()
                        
                        NavigationLink(destination: FavoritedItemsView(favoritedItems: $favoritedItems)) {
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("Favorites")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.black.opacity(0.2))
                            )
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 50) // Adds spacing at the top
                    
                    if let products = viewModel.product?.products {
                        ScrollView {
                            VStack(spacing: 15) {
                                ForEach(products, id: \.id) { product in
                                    NavigationLink {
                                        ProductDetailView(product: product)
                                    } label: {
                                        ProductRowView(product: product, favoritedItems: $favoritedItems)
                                            .padding(.horizontal) // Adds space around each row
                                    }
                                    .buttonStyle(PlainButtonStyle()) // Removes default NavigationLink styling
                                }
                            }
                        }
                    } else {
                        ProgressView("Loading products...")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .task {
            await viewModel.getProducts()
        }
    }
}

#Preview {
    ProductListView()
}
