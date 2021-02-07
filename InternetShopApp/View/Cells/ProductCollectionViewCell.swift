//
//  ProductCollectionViewCell.swift
//  InternetShopApp
//
//  Created by Чингиз Азимбаев on 04.02.2021.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ProductCollectionViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    var product: Product?
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func addAction(_ sender: Any) {
        guard let unwrappedProduct = product else {
            return
        }
        ShoppingCart.shared.addProduct(product: unwrappedProduct)
    }
}
