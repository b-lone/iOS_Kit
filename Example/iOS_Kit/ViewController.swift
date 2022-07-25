//
//  ViewController.swift
//  iOS_Kit
//
//  Created by b-lone on 07/25/2022.
//  Copyright (c) 2022 b-lone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let collectionViewTestViewController = CollectionViewTestViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(collectionViewTestViewController)
        view .addSubviewAndFill(collectionViewTestViewController.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

