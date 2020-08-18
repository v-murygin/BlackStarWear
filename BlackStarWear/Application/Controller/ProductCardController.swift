//
//  ProductCardController.swift
//  BlackStarWear
//
//  Created by Владислав on 18.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//

import Foundation
import UIKit

class ProductCardController: UIViewController {
    
    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemPrice: UILabel!
    @IBOutlet var itemDescription: UITextView!
    @IBOutlet var addToCart: UIButton!
    @IBOutlet var itemImage: UIImageView!
    
    var product = ItemData(data: [:])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDateInUI()
        addToCart.layer.cornerRadius = 10
        }
        
    func addDateInUI() {
        
        let priseFormated = Int(Double(product!.price)!)
        itemPrice.text = "\(priseFormated) руб. "
        itemName.text = product?.name
        itemDescription.text = product?.description
        let img = String(product!.mainImage)
        let imageFullUrl = "https://blackstarshop.ru/\(img)"
        itemImage.image = imagUrlToImage(imageUrl: imageFullUrl)
        

    }
    
    func imagUrlToImage (imageUrl:String)-> UIImage? {
        let imageUrl = URL(string: imageUrl)!
        let imageData = try! Data(contentsOf: imageUrl)
        return UIImage(data: imageData)
    }
    
    @IBAction func addToCartAction(_ sender: Any) {
    }
}
    
