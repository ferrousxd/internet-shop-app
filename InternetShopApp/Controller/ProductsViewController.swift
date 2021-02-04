//
//  ProductsViewController.swift
//  InternetShopApp
//
//  Created by Чингиз Азимбаев on 04.02.2021.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var productArray = [Product]()
    
    func populateProductArray() {
        productArray.append(Product(title: "Product 1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor", image: "iphone-12", price: 49.99))
        productArray.append(Product(title: "Product 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor", image: "logitech-g102", price: 49.99))
        productArray.append(Product(title: "Product 3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor", image: "airpods-pro", price: 49.99))
        productArray.append(Product(title: "Product 4", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor", image: "macbook-pro-16", price: 49.99))
        productArray.append(Product(title: "Product 5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor", image: "macbook-pro-13", price: 49.99))
        productArray.append(Product(title: "Product 6", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor", image: "steelseries-arctis-7", price: 49.99))
        productArray.append(Product(title: "Product 7", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor", image: "macmini-m1", price: 49.99))
        productArray.append(Product(title: "Product 8", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor", image: "logitech-g502", price: 49.99))
        productArray.append(Product(title: "Product 9", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor", image: "iphone-11-pro", price: 49.99))
        productArray.append(Product(title: "Product 10", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor", image: "magsafe-charger", price: 49.99))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isHidden = false
        collectionView.isHidden = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCollectionViewCell.nib, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductTableViewCell.nib, forCellReuseIdentifier: ProductTableViewCell.identifier)
        
        populateProductArray()
    }
    
    @IBAction func changeLayout(_ sender: Any) {
        if collectionView.isHidden {
            tableView.isHidden = true
            collectionView.isHidden = false
        } else {
            tableView.isHidden = false
            collectionView.isHidden = true
        }
    }
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        let product = productArray[indexPath.row]
        
        if let productImage = product.image {
            cell.productImageView.image = UIImage(named: productImage)
        }
        
        cell.productTitleLabel.text = product.title
        cell.productPriceLabel.text = "\(product.price ?? 0.0)$"
        cell.productDescriptionLabel.text = product.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let singleProductViewController = storyboard?.instantiateViewController(identifier: "SingleProductViewController") as! SingleProductViewController
        singleProductViewController.selectedProduct = productArray[indexPath.row]
        navigationController?.pushViewController(singleProductViewController, animated: true)
    }
}

extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        let product = productArray[indexPath.item]
        
        if let productImage = product.image {
            cell.productImageView.image = UIImage(named: productImage)
        }
        
        cell.productTitleLabel.text = product.title
        cell.productPriceLabel.text = "\(product.price ?? 0.0)$"
        cell.productDescriptionLabel.text = product.description
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = collectionView.bounds.width / 2.0
        return CGSize(width: side, height: side)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let singleProductViewController = storyboard?.instantiateViewController(identifier: "SingleProductViewController") as! SingleProductViewController
        singleProductViewController.selectedProduct = productArray[indexPath.item]
        navigationController?.pushViewController(singleProductViewController, animated: true)
    }
}
