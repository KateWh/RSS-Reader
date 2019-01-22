//
//  WebVC.swift
//  RSS-Reader
//
//  Created by ket on 18.01.2019.
//  Copyright © 2019 ket. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {

    @IBOutlet weak var webViewNews: WKWebView!
    var newsLink: URL?
    @IBOutlet weak var progressViewNews: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // load data from request url
        webViewNews.load(URLRequest(url: newsLink!))
        progressViewNews.progress = 0.0
        webViewNews.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            progressViewNews.setProgress(Float(webViewNews.estimatedProgress), animated: true)
            progressViewNews.isHidden = webViewNews.estimatedProgress == 1
    }
    
}
