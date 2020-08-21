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
    @IBOutlet var itemDescription: UILabel!
    @IBOutlet var addToCart: UIButton!
    @IBOutlet var itemImage: UIImageView!
    
    var product = ItemData(data: [:])
    var itemCard: [ItemData] = []
    var similarItem: [ItemData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDateInUI()
        addToCart.layer.cornerRadius = 10
        similarItem = similarProducts(article: product!.article)
        
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
    
    func similarProducts(article: String) -> [ItemData] {
        let article = article
        var similarProducts: [ItemData] = []
        for index in 0..<itemCard.count {
            if article == itemCard[index].article {
                similarProducts.append(itemCard[index])
            }
        }
        return similarProducts
    }
    
    @IBAction func addToCartAction(_ sender: Any) {
        
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpVCid") as! PopUpViewController
        
        popUpVC.item = self.similarItem
        self.addChild(popUpVC)
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: self)
    
        
    }
}

