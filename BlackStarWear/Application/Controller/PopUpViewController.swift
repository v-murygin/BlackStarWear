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
     var item: [ItemData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test.backgroundColor = .clear
        chooseButton.layer.cornerRadius = 10
        print(item.count)
       
    }
    
    @IBAction func chooseButtonAction(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
}
