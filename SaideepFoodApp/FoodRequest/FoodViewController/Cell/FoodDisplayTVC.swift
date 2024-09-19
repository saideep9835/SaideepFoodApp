//
//  FoodDisplayTVC.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/19/24.
//

import UIKit

class FoodDisplayTVC: UITableViewCell {

    @IBOutlet weak var itemImageLabel: UIImageView!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemWeightLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


