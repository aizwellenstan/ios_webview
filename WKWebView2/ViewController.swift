//
//  ViewController.swift
//  WKWebView
//
//  Created by MAC on 16/1/19.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https://google.com"
        let request = URLRequest(url: URL(string: url)!)
        self.webView.load(request)
        
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "loading" {
            
            if webView.isLoading {
                
                activityIndicator.startAnimating()
                activityIndicator.isHidden = false
                
            }else {
                
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
                
            }
            
        }
        
    }

}

