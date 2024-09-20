//
//  FoodDetailViewController.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/19/24.
//

import UIKit
import Kingfisher
class FoodDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var foodItem: FoodItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        if let foodItem = foodItem{
            self.nameLabel.text = foodItem.name
            let descriptions = foodItem.description.split(separator: ",")
        var bulletPointDescription = ""
    for item in descriptions {
    bulletPointDescription += "• \(item.trimmingCharacters(in: .whitespacesAndNewlines))\n"
                    }
                    

    self.descriptionLabel.text = bulletPointDescription
            let url = URL(string: foodItem.imageURL)
            self.imageView.kf.setImage(with: url)
            
        }
    }
    
    @IBAction func addCartButton(_ sender: UIButton) {
        
        
    }
    
    
   

}
