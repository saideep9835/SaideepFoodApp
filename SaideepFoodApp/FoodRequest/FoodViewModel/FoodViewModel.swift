//
//  FoodViewModel.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/18/24.
//

import Foundation


protocol APIFetchDelegate: AnyObject {
    func didFetchData(_ data: FoodMenu)
    func didFailWithError(_ error: Error)
}

protocol PriceButtonDelegate: AnyObject{
    func buttonClick(with price: Int)
}

class FoodViewModel{
    weak var delegate: APIFetchDelegate?
    weak var priceDelegate: PriceButtonDelegate?
    var priceValue:Int = 0
    var itemQuantity: [Int:Int] = [:]
    var cartItems: [FoodItem] = []
    
    func fetchData(){
        guard let apiUrl = URL(string: Constants.apiUrl.rawValue) else{ print("Invalid URL")
            return
        }
        print(apiUrl)
        FoodAPI.shared.getData(model: FoodMenu.self, url: apiUrl) { [weak self] result in
            switch result {
            case .success(let data):
                self?.delegate?.didFetchData(data)
            case .failure(let failure):
                self?.delegate?.didFailWithError(failure)
            }
        }
    }
    
    func cartButton(price: Int, item: FoodItem) {
   
          if let existingQuantity = itemQuantity[item.id] {
             
              itemQuantity[item.id] = existingQuantity + 1
          } else {
              itemQuantity[item.id] = 1
              cartItems.append(item)
          }
          priceValue += price
          self.priceDelegate?.buttonClick(with: priceValue)
      }

    func getCartItems() -> [(item: FoodItem, quantity: Int)] {
        var itemsWithQuantities: [(item: FoodItem, quantity: Int)] = []

        for item in cartItems {
            let quantity = itemQuantity[item.id] ?? 1 // Default to 1 if no quantity is found
            itemsWithQuantities.append((item, quantity))
        }

        return itemsWithQuantities
    }

        // Clear the cart
        func clearCart() {
            cartItems.removeAll()
            priceValue = 0
            priceDelegate?.buttonClick(with: priceValue)
        }
}
