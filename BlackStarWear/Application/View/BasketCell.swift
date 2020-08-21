//
//  BasketCell.swift
//  BlackStarWear
//
//  Created by Владислав on 18.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//

import UIKit

class BasketCell: UITableViewCell {

    @IBOutlet var imageBasketCell: UIImageView!
    @IBOutlet var nameBasketCell: UILabel!
    @IBOutlet var sizeBasketCell: UILabel!
    @IBOutlet var colorBasketCell: UILabel!
    @IBOutlet var priceBasketCell: UILabel!
    
    
    func itemCell(item: BasketCard) {
        
        let imageFullUrl = "https://blackstarshop.ru/\(item.mainImage)"
        imageBasketCell.image = imagUrlToImage(imageUrl: imageFullUrl)
        colorBasketCell.text = "Цвет: \(item.colorName)"
        nameBasketCell.text = item.name
        sizeBasketCell.text = "Размер: \(item.size)"
        let priseFormated = Int(Double(item.price)!)
        priceBasketCell.text = "\(priseFormated) руб."
        
    }
    
    func imagUrlToImage (imageUrl:String)-> UIImage? {
        let imageUrl = URL(string: imageUrl)!
        let imageData = try! Data(contentsOf: imageUrl)
        return UIImage(data: imageData)
    }
    
}
