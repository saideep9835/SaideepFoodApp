//
//  CartViewTVC.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/22/24.
//

import UIKit

class CartViewTVC: UITableViewCell {

    @IBOutlet weak var cartDescription: UILabel!
    @IBOutlet weak var nameOfItem: UILabel!
    @IBOutlet weak var qyantityxPrice: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var cartImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
