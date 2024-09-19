//
//  FoodGroupTVC.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/19/24.
//

import UIKit

class FoodGroupTVC: UITableViewCell {
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
