////
////  SubcategoriesTableViewController.swift
////  BlackStarWear
////
////  Created by Владислав on 15.08.2020.
////  Copyright © 2020 Murygin Vladislav. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//
//class SubcategoriesTableViewController: UITableViewController  {
//    
//    @IBOutlet var tabelViewSubcategory: UITableView!
//    
//    var subcategoryShop: NSArray = []
//    var category_ID: String = ""
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tabelViewSubcategory.reloadData()
//    }
//}
//
//extension SubcategoriesTableViewController {
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return subcategoryShop.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SubcategoriesCell", for: indexPath) as! CategoryCell
//        
//        let subcategory = subcategoryShop[indexPath.row] as! NSDictionary
//        let name = subcategory["name"] as! String
//        cell.categoryName.text = name
//        
//        
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        let goods = self.subcategoryShop[indexPath.row] as! NSDictionary
//        let id = goods["id"] as! String
//        self.category_ID = String(id)
//        performSegue(withIdentifier: "goodsList", sender: category_ID)
//        
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "goodsList" else { return }
//        guard let destination = segue.destination as? ProductLictController else { return }
//        destination.categoryID = category_ID
//        
//    }
//}
