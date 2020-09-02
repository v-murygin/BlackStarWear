//
//  CategoryLoader.swift
//  BlackStarWear
//
//  Created by Владислав on 14.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

class CategoryLoader {
    
    
    func loadJsoneCategory (completion: @escaping ([NSDictionary]) -> Void)  {
        SVProgressHUD.show()
        let shop_url = "http://blackstarshop.ru/index.php?route=api/v1/categories"
        
        _ =  AF.request(shop_url).responseJSON
            { response in
                if let objects = try? response.result.get(), let jsonDict = objects as? NSDictionary
                {
                    var сategoryData : [NSDictionary] = []
                    for (_ , item) in jsonDict {
                        сategoryData.append(item as! NSDictionary)
                    }
                    DispatchQueue.main.async {
                        completion(сategoryData)
                        SVProgressHUD.dismiss()
                    }
                }
        }
    }
    
    
    func loadJsoneItem (itemID: String, completion: @escaping ([ItemData]) -> Void)  {
        
        SVProgressHUD.show()
        let itemID = itemID
        let item_url = "http://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(itemID)"
        
        _ =  AF.request(item_url).responseJSON
            { response in
                if let objects = try? response.result.get(), let jsonDict = objects as? NSDictionary
                {
                    let dictionaryList = jsonDict
                    var itemData : [ItemData] = []
                    for (_ , item) in dictionaryList {
                        if let currentData = ItemData(data: item as! NSDictionary){
                            itemData.append(currentData)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        completion(itemData)
                        SVProgressHUD.dismiss()
                    }
                }
        }
    }
}

