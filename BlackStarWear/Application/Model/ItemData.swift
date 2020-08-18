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
      //  var offers: NSArray = []
    
    
        init?(data: NSDictionary) {

            guard
                let name = data["name"] as? String,
                let englishName = data["englishName"] as? String,
                let description = data["description"] as? String,
                let mainImage = data["mainImage"] as? String,
                let price = data["price"] as? String
              //  let offers = data["offers"] as? NSArray
                
                else {
                  //  print("Error")
                return nil
            }
            
            self.name = name
            self.englishName = englishName
            self.description = description
            self.mainImage = mainImage
            self.price = price
            //      self.offers = offers
            
        }
    
    
}
