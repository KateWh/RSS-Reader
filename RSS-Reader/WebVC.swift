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
    var newsLink: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        // load data from request url
        webViewNews.loadRequest(URLRequest(url: newsLink!))
    }

}
