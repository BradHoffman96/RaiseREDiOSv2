//
//  ViewEventViewController.swift
//  RaiseRED
//
//  Created by Bradley Hoffman on 12/6/16.
//  Copyright © 2016 Create. All rights reserved.
//
import UIKit

class ViewEventViewController: UIViewController {
    
    var event : Event?
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventDescLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventImageView.image = UIImage(named: (event?.imgId)!)?.resize(toWidth: 375)
        eventLocationLabel.text = event?.location
        eventTimeLabel.text = (event?.time)! + ":00 PM"
        eventDescLabel.text = event?.desc
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
