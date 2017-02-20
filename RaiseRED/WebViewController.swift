//
//  SecondViewController.swift
//  RaiseRED
//
//  Created by Bradley Hoffman on 11/23/16.
//  Copyright © 2016 Create. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    
    
    @IBOutlet weak var pdfWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pdfWebView.frame.size.width = self.view.bounds.width;
        pdfWebView.scrollView.contentOffset = CGPoint.zero
        let pdfLoc = NSURL(fileURLWithPath:Bundle.main.path(forResource: "raiseRED_handbook_singlepages", ofType:"pdf")!) //replace PDF_file with your pdf die name
        let request = NSURLRequest(url: pdfLoc as URL);
        self.pdfWebView.loadRequest(request as URLRequest);
        
        let label = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(150), height: CGFloat(36)))
        label.backgroundColor = UIColor.clear
        label.shadowColor = UIColor(white: CGFloat(0.0), alpha: CGFloat(0.5))
        label.textAlignment = .left
        label.attributedText = "<font color=\"white\" face=\"futura\" size = \"30\">GUI</font> <font color=\"#f50002\" face=\"futura\" size = \"30\">DE</font>".attributedStringFromHtml
        let backButton = UIBarButtonItem(customView: label)
        self.navigationItem.leftBarButtonItem = backButton
        /*let label2 = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(155), height: CGFloat(36)))
         label2.backgroundColor = UIColor.clear
         label2.shadowColor = UIColor(white: CGFloat(0.0), alpha: CGFloat(0.5))
         label2.textAlignment = .left
         label2.attributedText = "<font color=\"white\" face=\"futura\" size = \"30\">raise</font> <font color=\"#f50002\" face=\"futura\" size = \"30\">RED</font>".attributedStringFromHtml
         let forwardButton = UIBarButtonItem(customView: label2)
         self.navigationItem.rightBarButtonItem = forwardButton*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
