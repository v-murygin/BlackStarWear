//
//  BasketGoodsController.swift
//  BlackStarWear
//
//  Created by Владислав on 18.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//

import Foundation
import  UIKit




class BasketGoodsController: UIViewController {
    
    @IBOutlet var shopingTableView: UITableView!
    
    var shopingList: [BasketCard] = []
    var shopingItem: BasketCard? = nil
    var totalPrice = 0

    @IBOutlet var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updArray()
    //    totalPrice = totalPriceCount()
    }
}

extension BasketGoodsController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopingList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as! BasketCell
        cell.itemCell(item: shopingList[indexPath.row])
        return  cell
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> UITableViewRowAction? {
          
        let deleteAction = UITableViewRowAction(style: .default, title: "Удалить"){ _,_  in
            ItemForBasketCard.shared.item.remove(at: indexPath.row)
               self.shopingTableView.reloadData()
           }

           return deleteAction
       }
    
    func updArray(){
        shopingList = ItemForBasketCard.shared.item
        self.shopingTableView.reloadData()
    }
    
    func totalPriceCount()-> Int{
        var priseFormated = 0
            
        for index in 0...shopingList.count {
            let a = Int(Double(shopingList[index].price)!)
            priseFormated += a
        }
        return priseFormated
    }
    
 
}
