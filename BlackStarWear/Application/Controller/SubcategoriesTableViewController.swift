//
//  SubcategoriesTableViewController.swift
//  BlackStarWear
//
//  Created by Владислав on 15.08.2020.
//  Copyright © 2020 Murygin Vladislav. All rights reserved.
//

import Foundation
import UIKit


class SubcategoriesTableViewController: UITableViewController  {
   
    var subcategoryShop: NSArray = []
    @IBOutlet var tabelViewSubcategory: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelViewSubcategory.reloadData()

    }
}

extension SubcategoriesTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subcategoryShop.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubcategoriesCell", for: indexPath) as! CategoryCell
        
        let subcategory = subcategoryShop[indexPath.row] as! NSDictionary
       let name = subcategory["name"] as! String
        cell.categoryName.text = name
        
        let image = subcategory["iconImage"] as! String
        let imageFullUrl = "\(CategoryTableViewController().imageUrlString)\(image)"
        cell.categoryImage.image = CategoryTableViewController().imagUrlToImage(imageUrl: imageFullUrl)

        return cell
    }
}


