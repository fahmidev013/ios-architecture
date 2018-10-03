//
//  Songs.swift
//  LayoutPrototype
//
//  Created by Guy Fawkes on 06/09/18.
//  Copyright © 2018 Guy Fawkes. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper


struct SongsBackup {
    var title: String?
    var artist: String?
    var url: String?
    var image: String?
    var thumbnail_image: String?
    
    /*
     convenience init(title: String, artist: String, url: String, image: String, thumbnail_image: String) {
     self.init()
     self.title = title
     self.artist = artist
     self.url = url
     self.image = image
     self.thumbnail_image = thumbnail_image
     }
     */
    
    
    
    init(_ dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.artist = dictionary["artist"] as? String ?? ""
        self.url = dictionary["url"] as? String ?? ""
        self.image = dictionary["image"] as? String ?? ""
        self.thumbnail_image = dictionary["thumbnail_Image"] as? String ?? ""
    }
    
}


struct Lagu: Mappable {
    var title: String?
    var artist: String?
    var url: String?
    var image: String?
    var thumbnail_image: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.title <- map["title"]
        self.artist <- map["artist"]
        self.url <- map["url"]
        self.image <- map["image"]
        self.thumbnail_image <- map["thumbnail_image"]
    }
}


class Songs: Mappable {
    var title: String?
    var artist: String?
    var url: String?
    var image: String?
    var thumbnail_image: String?

    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.artist <- map["artist"]
        self.url <- map["url"]
        self.image <- map["image"]
        self.thumbnail_image <- map["thumbnail_image"]
    }
    
}
