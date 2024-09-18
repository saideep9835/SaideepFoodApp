//
//  FoodViewModel.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/18/24.
//

import Foundation

protocol APIFetchDelegate: AnyObject {
    func didFetchData(_ data: FoodMenu) // it should not be optional
    func didFailWithError(_ error: Error)
}

class FoodViewModel{
    weak var delegate: APIFetchDelegate?
    
    func fetchData(){
        guard let apiUrl = URL(string: Constants.apiUrl.rawValue) else{ print("Invalid URL")
            return
        }
        print(apiUrl)
        FoodAPI.shared.getData(model: FoodMenu.self, url: apiUrl) { [weak self] result in
            switch result {
            case .success(let data):
                print(data)
                self?.delegate?.didFetchData(data)
            case .failure(let failure):
                print(failure)
                self?.delegate?.didFailWithError(failure)
            }
        }
    }
}
