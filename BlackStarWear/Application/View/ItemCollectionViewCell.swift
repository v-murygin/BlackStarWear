//
//  ItemCollectionViewCell.swift
//  BlackStarWear
//
//  Created by Владислав on 17.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var itamName: UILabel!
    @IBOutlet var itemPrice: UILabel!
    
    func itemCell(item: ItemData) {
        
        let imageFullUrl = "https://blackstarshop.ru/\(item.mainImage)"
        itemImage.image = imagUrlToImage(imageUrl: imageFullUrl)
        itamName.text = item.name
        let priseFormated = Int(Double(item.price)!)
        itemPrice.text = "\(priseFormated) руб. "
        
    }
    
    func imagUrlToImage (imageUrl:String)-> UIImage? {
        let imageUrl = URL(string: imageUrl)!
        let imageData = try! Data(contentsOf: imageUrl)
        return UIImage(data: imageData)
    }
    
}
