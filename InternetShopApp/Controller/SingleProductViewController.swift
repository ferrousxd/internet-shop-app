//
//  SingleProductViewController.swift
//  InternetShopApp
//
//  Created by Чингиз Азимбаев on 04.02.2021.
//

import UIKit

class SingleProductViewController: UIViewController {
    
    var selectedProduct: Product?

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProduct()
    }
    
    func setProduct() {
        guard let product = selectedProduct else {
            return
        }
        
        if let productImage = product.image {
            productImageView.image = UIImage(named: productImage)
        }
        
        productTitleLabel.text = product.title
        productPriceLabel.text = "\(product.price ?? 0.0)$"
        productDescriptionLabel.text = product.description
    }
    
    @IBAction func addAction(_ sender: Any) {
        guard let unwrappedProduct = selectedProduct else {
            return
        }
        ShoppingCart.shared.addProduct(product: unwrappedProduct)
    }
}
