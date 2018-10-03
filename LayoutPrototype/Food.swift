//
//  Food.swift
//  LayoutPrototype
//
//  Created by Guy Fawkes on 03/09/18.
//  Copyright © 2018 Guy Fawkes. All rights reserved.
//

import Foundation
import UIKit

class Food {

    var foodName: String?
    var imageName: String?
    var image: UIImage?
    var rating: Int?
    var foodDescription: String?
    
    
    convenience init(foodImage: String, nameFood: String, rating: Int, descFood: String) {
        self.init()
        self.imageName = foodImage
        self.foodName = nameFood
        self.rating = rating
        self.foodDescription = descFood
    }
    
    

}
