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
    
    var categoryShop: [NSDictionary] = []
    let imageUrlString =  "https://blackstarshop.ru/"
    var selectedSubcategories: NSArray = []
    
    @IBOutlet var tableViewCategory: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        CategoryLoader().loadJSONE { сategoryData in
            self.categoryShop = сategoryData
            self.tableViewCategory.reloadData()
        }

        
    }
    
}

extension CategoryTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryShop.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CategoryCell
        
        let category = categoryShop[indexPath.row]
        let name = category["name"]! as! String
        cell.categoryName.text = name

        let image = category["image"]! as! String
        let imageFullUrl = "\(imageUrlString)\(image)"
        cell.categoryImage.image = imagUrlToImage(imageUrl: imageFullUrl)
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        self.selectedSubcategories = self.categoryShop[indexPath.row]["subcategories"] as! NSArray

           performSegue(withIdentifier: "subcategories", sender: selectedSubcategories)
    
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "subcategories" else { return }
            guard let destination = segue.destination as? SubcategoriesTableViewController else { return }
            destination.subcategoryShop = selectedSubcategories

    }

    
    func imagUrlToImage (imageUrl:String)-> UIImage? {
        let imageUrl = URL(string: imageUrl)!
        let imageData = try! Data(contentsOf: imageUrl)
        return UIImage(data: imageData)
    }
    
}




