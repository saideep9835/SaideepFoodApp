//
//  FoodAPI.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/18/24.
//



import Foundation


struct FoodMenu: Codable {
    let foodGroups: [FoodGroup]
    
    enum CodingKeys: String, CodingKey{
        case foodGroups = "food_groups"
    }
}

struct FoodGroup: Codable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let foodItems: [FoodItem]
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case description
        case imageURL = "image_url"
        case foodItems = "food_items"
    }
}

struct FoodItem: Codable {
    let id: Int
    let name: String
    let description: String
    let weight: Int
    let price: Int
    let imageURL: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case description
        case weight
        case price
        case imageURL = "image_url"
    }
    
//    static func ==(lhs: FoodItem, rhs: FoodItem) -> Bool {
//            return lhs.name == rhs.name && lhs.price == rhs.price
//        }
}
