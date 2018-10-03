//
//  FoodTableViewCell.swift
//  LayoutPrototype
//
//  Created by Guy Fawkes on 03/09/18.
//  Copyright © 2018 Guy Fawkes. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageFood: UIImageView?
    @IBOutlet weak var nameFoodLabel: UILabel?
    @IBOutlet weak var ratingLabel: UILabel?
    @IBOutlet weak var desFoodLabel: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
