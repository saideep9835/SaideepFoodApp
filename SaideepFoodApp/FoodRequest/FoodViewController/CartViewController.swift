//
//  CartViewController.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/20/24.
//

import UIKit
import Kingfisher

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var cartItems: [(item: FoodItem, quantity: Int)] = []
    var total: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        totalPriceLabel.text = "$\(total)"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    @IBAction func confirmOrder(_ sender: UIButton) {
        guard let confirm = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmViewController") as? ConfirmViewController else {return}
        navigationController?.pushViewController(confirm, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartViewTVC", for: indexPath) as? CartViewTVC else {return UITableViewCell()}
        let cartItem = cartItems[indexPath.row]
        cell.nameOfItem?.text = cartItem.item.name
        let url = URL(string: cartItems[indexPath.row].item.imageURL)
        cell.cartImageView.kf.setImage(with: url)
        cell.cartDescription?.text = cartItem.item.description
        //cell.detailTextLabel?.text = "$\(item.price)"
        cell.qyantityxPrice.text = "Quantity: \(String(cartItem.item.price) + "x" + String(cartItem.quantity))"
        cell.totalPrice.text = "Total: \(String(cartItem.item.price * cartItem.quantity))"
        return cell
    }
}
