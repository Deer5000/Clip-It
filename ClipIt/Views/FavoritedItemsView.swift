//
//  FavoritedItemsView.swift
//  ClipIt
//
//  Created by Khidr Brinkley on 12/21/24.
//

import SwiftUI

struct FavoritedItemsView: View {
    @Binding var favoritedItems: [ProductElement] // Binding to allow removal of items

    var body: some View {
        VStack {
            Text("Favorited Items")
                .font(.title)
                .padding()

            if favoritedItems.isEmpty {
                Text("No favorited items yet!")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(favoritedItems, id: \.id) { item in
                        HStack {
                            AsyncImage(url: URL(string: item.thumbnail)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)
                            } placeholder: {
                                ProgressView()
                            }
                            Text(item.title)
                                .foregroundColor(.primary)
                        }
                    }
                    .onDelete(perform: delete) // Enable swipe-to-delete
                }
            }
        }
        .navigationTitle("Favorited Items")
    }

    // Function to delete an item
    private func delete(at offsets: IndexSet) {
        favoritedItems.remove(atOffsets: offsets)
    }
}

#Preview {
    FavoritedItemsView(favoritedItems: .constant([
        ProductElement(id: 1, title: "Sample Product", description: "This is a sample product.", category: .beauty, price: 19.99, discountPercentage: 10, rating: 4.5, stock: 20, tags: ["tag1", "tag2"], brand: "Sample Brand", sku: "SKU123", weight: 2, dimensions: Dimensions(width: 10, height: 5, depth: 3), warrantyInformation: "2 years", shippingInformation: "Ships in 3 days", availabilityStatus: .inStock, reviews: nil, returnPolicy: .the30DaysReturnPolicy, minimumOrderQuantity: 1, meta: nil, images: [], thumbnail: "https://via.placeholder.com/100")
    ]))
}
