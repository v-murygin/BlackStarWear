//
//  ViewController.swift
//  BlackStarWear
//
//  Created by Владислав on 13.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//

import UIKit
import Foundation


class CategoryTableViewController: UITableViewController {
    
    @IBOutlet var tableViewCategory: UITableView!
    @IBOutlet var allItem: UIBarButtonItem!
    @IBOutlet var navBar: UINavigationItem!
    
    var categoryShop: [NSDictionary] = []
    let imageUrlString =  "https://blackstarshop.ru/"
    var selectedSubcategories: NSArray = []
    
    var tableIndex = 0
    var subcategoryShop: NSArray = []
    var category_ID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoryLoader().loadJsoneCategory { сategoryData in
            self.categoryShop = сategoryData
            self.tableViewCategory.reloadData()
        }
        
        allItem.isEnabled = false
        allItem.tintColor = UIColor.clear
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        tableIndex = 0
        tableViewCategory.reloadData()
        allItem.isEnabled = false
        allItem.tintColor = UIColor.clear
        
    }
}

extension CategoryTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var  index = 0
        
        if tableIndex == 0 {
            index = categoryShop.count
        } else if tableIndex == 1 {
            index = selectedSubcategories.count}
        
        return index
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = CategoryCell()
        
        if tableIndex == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CategoryCell
            let category = categoryShop[indexPath.row]
            let name = category["name"]! as! String
            cell.categoryName.text = name
            let image = category["image"]! as! String
            let imageFullUrl = "\(imageUrlString)\(image)"
            cell.categoryImage.image = imagUrlToImage(imageUrl: imageFullUrl)
            
        } else if tableIndex == 1 {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "SubcategoriesCell", for: indexPath) as! CategoryCell
            let subcategory = subcategoryShop[indexPath.row] as! NSDictionary
            let name = subcategory["name"] as! String
            cell.categoryName.text = name
            
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if tableIndex == 0 {
            
            tableIndex = 1
            self.selectedSubcategories = self.categoryShop[indexPath.row]["subcategories"] as! NSArray
            subcategoryShop = selectedSubcategories
            
            allItem.isEnabled = true
            allItem.tintColor = UIColor.blue
            
        } else if tableIndex == 1
        {
            let goods = self.subcategoryShop[indexPath.row] as! NSDictionary
            let id = goods["id"] as! String
            self.category_ID = String(id)
            
            self.performSegue(withIdentifier: "goodsList", sender: category_ID)
        }
        tableViewCategory.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goodsList" else { return }
        guard let destination = segue.destination as? ProductLictController else { return }
        destination.categoryID = category_ID
        
    }
    
    func imagUrlToImage (imageUrl:String)-> UIImage? {
        let imageUrl = URL(string: imageUrl)!
        let imageData = try! Data(contentsOf: imageUrl)
        return UIImage(data: imageData)
    }
}
