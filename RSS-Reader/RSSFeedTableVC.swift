//
//  ViewController.swift
//  RSS-Reader
//
//  Created by ket on 16.01.2019.
//  Copyright © 2019 ket. All rights reserved.
//

import UIKit

class RSSFeedTableVC: UITableViewController {

    let core = CoreRSS()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        core.getData { (error) in
            print(error)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

