//
//  FoodViewController.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/18/24.
//

import UIKit

class FoodViewController: UIViewController,  APIFetchDelegate{
    

    let viewModel = FoodViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        // Do any additional setup after loading the view.
    }
    
    func didFetchData(_ data: FoodMenu) {
        print("-----------Received data--------------: \(String(describing: data))")
        let dataItems = data
        print("Fetched data: \(dataItems)")
    }
    
    func didFailWithError(_ error: any Error) {
        print("Error: \(error.localizedDescription)")
    }
    

}
