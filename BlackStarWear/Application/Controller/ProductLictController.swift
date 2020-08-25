//
//  ProductLictController.swift
//  BlackStarWear
//
//  Created by Владислав on 15.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//
import UIKit
import Foundation


class ProductLictController: UICollectionViewController {
    
    @IBOutlet var itemCollectionView: UICollectionView!
    
    var categoryID: String = ""
    var itemData: [ItemData] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryLoader().loadJsoneItem(itemID: categoryID) { itemData in
            self.itemData = itemData
            self.itemCollectionView.reloadData()
        }
    }
}


extension ProductLictController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCollectionViewCell
        cell.itemCell(item: itemData[indexPath.row])
        return cell
    }
    
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.size.width/2
        return CGSize(width: w, height: w*2 )
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.performSegue(withIdentifier: "ProductCard", sender: self)
 }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ProductCard" else { return }
        guard let destination = segue.destination as? ProductCardController else { return }
        let productSelect = itemData[self.index]
        destination.product = productSelect
        destination.itemCard = itemData
    }
    
}

