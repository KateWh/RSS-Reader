//
//  WebVC.swift
//  RSS-Reader
//
//  Created by ket on 18.01.2019.
//  Copyright © 2019 ket. All rights reserved.
//

import UIKit

class WebVC: UIViewController {

    @IBOutlet weak var webViewNews: UIWebView!
    var newsLink = URL(string: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        webViewNews.loadRequest(URLRequest(url: newsLink!))
    }

}
