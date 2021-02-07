//
//  ShoppingCartViewController.swift
//  InternetShopApp
//
//  Created by Чингиз Азимбаев on 07.02.2021.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ShoppingCartItemTableViewCell.nib, forCellReuseIdentifier: ShoppingCartItemTableViewCell.identifier)
    }
    
    
    @IBAction func confirmOrderAction(_ sender: Any) {
        let confirmOrderAlert = UIAlertController(title: "Confirm Order", message: "Operation was successfully finished", preferredStyle: .alert)
        confirmOrderAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            ShoppingCart.shared.emptyShoppingCart()
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(confirmOrderAlert, animated: true, completion: nil)
    }
}

extension ShoppingCartViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingCart.shared.cart.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingCartItemTableViewCell.identifier, for: indexPath) as! ShoppingCartItemTableViewCell
        let product = ShoppingCart.shared.cart[indexPath.row]
        
        if let productImage = product.image {
            cell.productImageView.image = UIImage(named: productImage)
        }
        
        cell.productTitleLabel.text = product.title
        cell.productPriceLabel.text = "\(product.price ?? 0.0)$"
        cell.productDescriptionLabel.text = product.description
        
        return cell
    }
}
