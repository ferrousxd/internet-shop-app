//
//  ProductTableViewCell.swift
//  InternetShopApp
//
//  Created by Чингиз Азимбаев on 04.02.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: ProductTableViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
