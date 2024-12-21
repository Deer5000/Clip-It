//
//  ProductDetailView.swift
//  ClipIt
//
//  Created by Khidr Brinkley on 12/21/24.
//

import SwiftUI

struct ProductDetailView: View {
    var product: ProductElement // Assuming Product is your data model
    
    var body: some View {
        ZStack {
            Text("WIP")
        }
    }
}

#Preview {
    ProductDetailView(product: ProductElement(id: 39923, title: "Car", description: "cool convertible", category: nil, price: 11.99, discountPercentage: 10.5, rating: 3.0, stock: 23, tags: ["cool", "Drop Top"], brand: "maserati", sku: "dckdkmckdmkc", weight: 1900, dimensions: nil, warrantyInformation: "no warranty", shippingInformation: "1-day", availabilityStatus: .lowStock, reviews: nil, returnPolicy: .the30DaysReturnPolicy, minimumOrderQuantity: 20, meta: nil, images: ["https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/1.png"], thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/thumbnail.png"))
}
