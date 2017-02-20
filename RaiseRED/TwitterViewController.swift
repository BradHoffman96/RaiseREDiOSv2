//
//  TwitterViewController.swift
//  RaiseRED
//
//  Created by Bryan Evans Evans on 2/16/17.
//  Copyright © 2017 Create. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(150), height: CGFloat(36)))
        label.backgroundColor = UIColor.clear
        label.shadowColor = UIColor(white: CGFloat(0.0), alpha: CGFloat(0.5))
        label.textAlignment = .left
        label.attributedText = "<font color=\"white\" face=\"futura\" size = \"30\">TWIT</font> <font color=\"#f50002\" face=\"futura\" size = \"30\">TER</font>".attributedStringFromHtml
        let backButton = UIBarButtonItem(customView: label)
        self.navigationItem.leftBarButtonItem = backButton
        // Create an API client and data source to fetch Tweets for the timeline
        let client = TWTRAPIClient()
        //TODO: Replace with your collection id or a different data source
        let dataSource = TWTRUserTimelineDataSource(screenName: "raiseRED_UofL", apiClient: client)
        // Create the timeline view controller
        let timelineViewControlller = TWTRTimelineViewController(dataSource: dataSource)
        timelineViewControlller.view.frame = self.view.bounds
        
        self.addChildViewController(timelineViewControlller)
        self.addSubview(subView: timelineViewControlller.view, toView: self.containerView)
    }
    
    
    func addSubview(subView:UIView, toView parentView:UIView) {parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
