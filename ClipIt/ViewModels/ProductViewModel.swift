//
//  ProductViewModel.swift
//  ClipIt
//
//  Created by Khidr Brinkley on 12/21/24.
//

import Foundation

@MainActor
class ProductViewModel: ObservableObject {
    @Published var product: Product?
    @Published var errorMessage: String?
    
    func getProducts() async {
        do {
            let product = try await WebService().fetchProductData()
            self.product = product
        } catch (let error) {
            self.errorMessage = error.localizedDescription
        }
    }
}
