//
//  FoodViewController.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/18/24.
//

import UIKit
import Kingfisher
class FoodViewController: UIViewController,  APIFetchDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var foodGroupData: [FoodGroup] = []
    let viewModel = FoodViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        viewModel.fetchData()
        // Do any additional setup after loading the view.
    }
    
    func didFetchData(_ data: FoodMenu) {
        let dataItems = data
        self.foodGroupData = dataItems.foodGroups
        print(foodGroupData)
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        
    }
    
    func didFailWithError(_ error: any Error) {
        print("Error: \(error.localizedDescription)")
    }
    

}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return foodGroupData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "FoodGroupTVC", for: indexPath) as? FoodGroupTVC else{return UITableViewCell()}
    
        let foodtype = foodGroupData[indexPath.row]
        let url = URL(string: foodtype.imageURL)
        
        cell.foodNameLabel.text = foodtype.name
        cell.foodDescriptionLabel.text = foodtype.description
        cell.foodImageView.kf.setImage(with: url)
      
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCategory = foodGroupData[indexPath.row].name
    
            print("Selected Category: \(selectedCategory)")

        let selectedFoodGroup = foodGroupData[indexPath.row].foodItems
        guard let selectedCell = storyboard?.instantiateViewController(withIdentifier: "FoodDisplayTV") as? FoodDisplayTV else{return}
        selectedCell.selectedFoodCategory = selectedFoodGroup
        navigationController?.pushViewController(selectedCell, animated: true)
    }
    
}

