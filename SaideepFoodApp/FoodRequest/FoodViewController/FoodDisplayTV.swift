//
//  FoodDisplayTV.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/19/24.
//

import UIKit
import Kingfisher
class FoodDisplayTV: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedFoodCategory: [FoodItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
}

extension FoodDisplayTV: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(selectedFoodCategory.count)
        return selectedFoodCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let selectedFood = self.tableView.dequeueReusableCell(withIdentifier: "FoodDisplayTVC") as? FoodDisplayTVC else{return UITableViewCell()}
        let foodItem = selectedFoodCategory[indexPath.row]
        selectedFood.itemNameLabel.text = foodItem.name
        selectedFood.itemWeightLabel.text = "\(String(foodItem.weight)) g"
        selectedFood.itemPriceLabel.text = "$\(String(foodItem.price))"
        selectedFood.itemDescriptionLabel.text = foodItem.description
        let url = URL(string: foodItem.imageURL)
        selectedFood.itemImageLabel.kf.setImage(with: url)
        return selectedFood
    }
}
