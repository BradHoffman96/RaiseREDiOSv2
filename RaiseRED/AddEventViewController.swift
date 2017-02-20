//
//  AddEventViewController.swift
//  RaiseRED
//
//  Created by Bradley Hoffman on 12/6/16.
//  Copyright © 2016 Create. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var eventDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventDescription.delegate = self
        eventDescription.text = "Event Description"
        eventDescription.textColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.white {
            textView.text = nil
            textView.textColor = UIColor.white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Event Description"
            textView.textColor = UIColor.white
        }
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
