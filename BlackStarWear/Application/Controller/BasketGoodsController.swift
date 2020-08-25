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
    @IBOutlet var totalView: UIView!
    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var sendOrderButton:UIButton!
    
    var shopingList: [BasketCard] = []
    var shopingItem: BasketCard? = nil

    override func  viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        updArray()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updArray()
        totalPriceCount()
        sendOrderButton.layer.cornerRadius = 10
    }
    
    @IBAction func sendOrder(_ sender: Any) {
    print("Спасибо за покупко, но это не настоящий магазин! ")
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Удалить"){ _,_  in
            ItemForBasketCard.shared.item.remove(at: indexPath.row)
            self.updArray()
            self.totalPriceCount()
        }
        return [deleteAction]
    }
    
    func updArray(){
        shopingList = ItemForBasketCard.shared.item
        self.shopingTableView.reloadData()
    }
    
    func totalPriceCount(){
        var priseFormated = 0
        for index in 0..<shopingList.count {
            let a = Int(Double(shopingList[index].price)!)
            priseFormated += a
        }
        self.totalPriceLabel.text = "\(priseFormated) руб."
    }
    
    
}
