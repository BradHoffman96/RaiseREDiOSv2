//
//  TwitterViewController.swift
//  RaiseRED
//
//  Created by Bryan Evans Evans on 2/16/17.
//  Copyright © 2017 Create. All rights reserved.
//

import UIKit

class InstagramViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIWebView.loadRequest(webview)(NSURLRequest(url: NSURL(string: "https://www.instagram.com/raisered_uofl/")! as URL) as URLRequest)
        webview.frame = self.view.bounds
        let label = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(250), height: CGFloat(36)))
        label.backgroundColor = UIColor.clear
        label.shadowColor = UIColor(white: CGFloat(0.0), alpha: CGFloat(0.5))
        label.textAlignment = .left
        label.attributedText = "<font color=\"white\" face=\"futura\" size = \"30\">INSTA</font> <font color=\"#f50002\" face=\"futura\" size = \"30\">GRAM</font>".attributedStringFromHtml
        let backButton = UIBarButtonItem(customView: label)
        self.navigationItem.leftBarButtonItem = backButton
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
