//
//  ItemData.swift
//  BlackStarWear
//
//  Created by Владислав on 17.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//

import UIKit
import Foundation

class ItemData {
    
    var name = ""
    var englishName = ""
    var description = ""
    var mainImage = ""
    var price = ""
    var colorName = ""
    var colorImageURL = ""
    var article = ""
    var offers: NSArray = []
    var productImages: NSArray = []
    
    init?(data: NSDictionary) {
        
        guard
            let name = data["name"] as? String,
            let englishName = data["englishName"] as? String,
            let description = data["description"] as? String,
            let mainImage = data["mainImage"] as? String,
            let price = data["price"] as? String,
            let colorName = data["colorName"]  as? String,
            let colorImageURL = data["colorImageURL"]  as? String,
            let article = data["article"] as? String,
            let offers = data["offers"] as? NSArray,
            offers.count !=  0,
            let productImages = data["productImages"] as? NSArray
            else {
                return nil
        }
        
        self.name = name
        self.englishName = englishName
        self.description = description
        self.mainImage = mainImage
        self.price = price
        self.offers = offers
        self.colorImageURL = colorImageURL
        self.colorName = colorName
        self.productImages = productImages
        self.article = article
        
    }
    
}
