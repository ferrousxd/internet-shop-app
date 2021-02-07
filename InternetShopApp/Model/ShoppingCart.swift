//
//  CartSingleton.swift
//  InternetShopApp
//
//  Created by Чингиз Азимбаев on 07.02.2021.
//

import Foundation

class ShoppingCart {
    
    var cart = [Product]()
    
    static var shared: ShoppingCart = {
        let instance = ShoppingCart()
        return instance
    }()
    
    private init() {}
    
    func addProduct(product: Product) {
        cart.append(product)
    }
    
    func emptyShoppingCart() {
        cart.removeAll()
    }
}
