//
//  FoodAPI.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/18/24.
//

import Foundation

class FoodAPI{
    
    static let shared = FoodAPI()
    
    private init(){ }
    
    func getData<T: Decodable>(model: T.Type, url: URL, completion: @escaping(Result<T, Error>) -> Void){
    
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            guard let data = data else{
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey:"No data"])
                completion(.failure(error))
                return
            }
            do{
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                print("Decoded Data: \(decodedData)")
                } catch {
                    
                    completion(.failure(error))
                }
        }.resume()
    }

}
