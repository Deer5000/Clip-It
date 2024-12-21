//
//  ProductRowView.swift
//  ClipIt
//
//  Created by Khidr Brinkley on 12/21/24.
//

import SwiftUI

struct ProductRowView: View {
    var product: ProductElement
    @Binding var favoritedItems: [ProductElement]
    @State private var isFavorited = false // Tracks whether the item is favorited

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack(spacing: 10) {
                // Product Image
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100) // Fixed size for the image
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }

                VStack(alignment: .leading, spacing: 5) {
                    // Product Title
                    Text(product.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
                        .fixedSize(horizontal: false, vertical: true) // Allows text to wrap
                    
                    // Product Price
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .shadow(color: .black.opacity(0.5), radius: 1, x: 0, y: 1)

                    // Product Category
                    Text(product.category?.rawValue.capitalized ?? "Uncategorized")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.8))
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Aligns content to the left

                // Favorite Button
                Button(action: {
                    isFavorited.toggle()
                    if isFavorited {
                        favoritedItems.append(product)
                    } else {
                        favoritedItems.removeAll { $0.id == product.id }
                    }
                }) {
                    Image(systemName: isFavorited ? "star.fill" : "star")
                        .foregroundColor(isFavorited ? .yellow : .white)
                        .font(.title3)
                        .padding(10)
                        .background(
                            Circle()
                                .fill(Color.black.opacity(0.5))
                        )
                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
                }
                .padding(10)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, minHeight: 120, maxHeight: 120) // Ensures consistent row height
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.orange.opacity(0.8), Color.red.opacity(0.9)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

#Preview {
    ProductListView()
//    ProductRowView(product: ProductElement(
//        id: 1,
//        title: "Sample Product",
//        description: "This is a sample product.",
//        category: .beauty,
//        price: 19.99,
//        discountPercentage: 10,
//        rating: 4.5,
//        stock: 20,
//        tags: ["tag1", "tag2"],
//        brand: "Sample Brand",
//        sku: "SKU123",
//        weight: 2,
//        dimensions: Dimensions(width: 10, height: 5, depth: 3),
//        warrantyInformation: "2 years",
//        shippingInformation: "Ships in 3 days",
//        availabilityStatus: .inStock,
//        reviews: nil,
//        returnPolicy: .the30DaysReturnPolicy,
//        minimumOrderQuantity: 1,
//        meta: nil,
//        images: [],
//        thumbnail: "https://via.placeholder.com/100"
//    ))
}
