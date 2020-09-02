//
//  PopUpViewController.swift
//  BlackStarWear
//
//  Created by Владислав on 18.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet var chooseButton: UIButton!
    @IBOutlet var test: UIView!
    @IBOutlet var colorTable: UITableView!
    @IBOutlet var sizeTable: UITableView!
    
    var item: [ItemData] = []
    var indexColor = 0
    var indexSize = 0
    var colorSelect = ""
    var rowCount = 0
    var sizeDictionary: NSArray = []
    var arraySelectedColorItem: NSDictionary = [:]
    var selectedSize = ""
    var basket: BasketCard? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        test.backgroundColor = .clear
        chooseButton.layer.cornerRadius = 10
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func chooseButtonAction(_ sender: Any) {
        
        basket = BasketCard(data: item[indexColor], sizeSelect: selectedSize, colorSelect: colorSelect, indexSize: indexSize)
        
        if basket?.size == nil {
            let alert = UIAlertController(title: "Данный размер закончился :( ", message: "Пожалуйста, выберите другой размер или цвет.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            ItemForBasketCard.shared.item.append(basket!)
            self.view.removeFromSuperview()
        }
    }
}

extension PopUpViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == self.colorTable) {
            self.rowCount =  item.count
        }
        if (tableView == self.sizeTable) {
            if indexColor == 0 {
                self.rowCount = item[0].offers.count
            }
        }
        return self.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == self.colorTable){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as! ProductColorCell
            cell.colorLabel.text = item[indexPath.row].colorName
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SizeCell", for: indexPath) as! ProductSizeCell
            if indexColor == 0 {
                let labelArray = item[0].offers[indexPath.row] as! NSDictionary
                let labelText = labelArray["size"] as! String
                cell.sizeLabel.text = labelText
            } else {
                indexSize = indexPath.row
                let labelArray = sizeDictionary[indexPath.row] as! NSDictionary
                let labelText = labelArray["size"] as! String
                cell.sizeLabel.text = labelText
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == self.colorTable) {
            self.indexColor = indexPath.row
            self.colorSelect = item[indexColor].colorName
            self.rowCount =  item[indexColor].offers.count
            self.sizeDictionary = item[indexColor].offers
            self.sizeTable.reloadData()
        }
        if (tableView == self.sizeTable) {
            self.arraySelectedColorItem = sizeDictionary[indexPath.row] as! NSDictionary
            self.selectedSize = arraySelectedColorItem["size"] as! String
        }
    }
}
