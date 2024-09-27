//
//  FoodDisplayTV.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/19/24.
//

import UIKit
import Kingfisher
class FoodDisplayTV: UIViewController, PriceButtonDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var priceLabel: UILabel!
    //@IBOutlet weak var incrementCart: UIButton!
    var selectedFoodCategory: [FoodItem] = []
    let viewModel = FoodViewModel()
    var totalAmount: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.priceDelegate = self
        // Do any additional setup after loading the view.
        priceLabel.text = "\(0)"
        cartButtonCreate()
    }
    
    func buttonClick(with price: Int) {
        
        priceLabel.text = "$\(price)"
        totalAmount = Double(price)
    }
    
    func cartButtonCreate(){
            let cartButton = UIBarButtonItem(title: "cart", style: .plain, target: self, action: #selector(cartButtonTapped))
                navigationItem.rightBarButtonItem = cartButton
        }
        
    @IBAction func buttonClicked(_ sender: UIButton) {
        let itemIndex = sender.tag
        let selectedItem = selectedFoodCategory[itemIndex]
        let itemPrice = selectedItem.price
        print("Index: \(itemIndex), Item: \(selectedItem.name), Price: \(itemPrice)")
        viewModel.cartButton(price: itemPrice, item: selectedFoodCategory[itemIndex])
    }
    
    @objc func cartButtonTapped() {
        // Handle the button tap
        print("Cart button tapped!")
        guard let cartVC = storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else {  print("Failed to instantiate CartViewController from storyboard")
            return }
        cartVC.cartItems = viewModel.getCartItems()
        //print("Navigation to cart will proceed with items: \(viewModel.getCartItems().count)")
        cartVC.total = totalAmount
        navigationController?.pushViewController(cartVC, animated: true)
    }
}

extension FoodDisplayTV: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedFoodCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let selectedFood = self.tableView.dequeueReusableCell(withIdentifier: "FoodDisplayTVC") as? FoodDisplayTVC else{return UITableViewCell()}
        let foodItem = selectedFoodCategory[indexPath.row]
        selectedFood.itemNameLabel.text = foodItem.name
        selectedFood.itemWeightLabel.text = "\(String(foodItem.weight)) g"
        selectedFood.itemPriceLabel.text = "$\(String(foodItem.price))"
        selectedFood.itemDescriptionLabel.text = foodItem.description
        selectedFood.priceIncrementButton.tag = indexPath.row
        selectedFood.priceIncrementButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        let url = URL(string: foodItem.imageURL)
        selectedFood.itemImageLabel.kf.setImage(with: url)
        return selectedFood
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFoodItem = selectedFoodCategory[indexPath.row]
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "FoodDetailViewController") as? FoodDetailViewController {
                detailViewController.foodItem = selectedFoodItem  // Pass the specific item to the detail view controller
               present(detailViewController, animated: true, completion: nil)
            }

            tableView.deselectRow(at: indexPath, animated: true)
    }
}
