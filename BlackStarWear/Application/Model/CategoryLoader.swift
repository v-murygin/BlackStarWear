//
//  CategoryLoader.swift
//  BlackStarWear
//
//  Created by Владислав on 14.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//

import Foundation
import Alamofire


let shop_url = "http://blackstarshop.ru/index.php?route=api/v1/categories"

let itemID = ""
let item_url = "http://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(itemID)"


class CategoryLoader {
    
    
    func loadJSONE (completion: @escaping ([NSDictionary]) -> Void)  {
        
        
        _ =  AF.request(shop_url).responseJSON
        { response in
            if let objects = try? response.result.get(), let jsonDict = objects as? NSDictionary
            {
                
                var сategoryData : [NSDictionary] = []
                
                сategoryData.append(jsonDict["67"] as! NSDictionary)
                сategoryData.append(jsonDict["68"] as! NSDictionary )
                сategoryData.append(jsonDict["69"] as! NSDictionary )
                сategoryData.append(jsonDict["73"] as! NSDictionary )
                сategoryData.append(jsonDict["156"] as! NSDictionary )
                сategoryData.append(jsonDict["165"] as! NSDictionary )
                
//                сategoryData.append(jsonDict["123"] as! NSDictionary )
//                сategoryData.append(jsonDict["74"] as! NSDictionary )
//                сategoryData.append(jsonDict["323"] as! NSDictionary )
               
                DispatchQueue.main.async {
                    completion(сategoryData)
                }

            }
        }
    }
    
    
}
