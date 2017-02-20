//
//  Event.swift
//  TabeViewTests
//
//  Created by John Nagel on 2/11/17.
//  Copyright © 2017 John Nagel. All rights reserved.
//

import UIKit
import Firebase

class Event: NSObject {
    
    // MARK: Properties
    
    var imgId: String
    var title: String
    var desc: String = ""
    var time: String = ""
    var location: String = ""
    
    // MARK: Initialization
    
    init?(imgId: String, title: String, desc: String, time: String, location: String) {
        // Initialize stored properties.
        self.imgId = imgId
        self.title = title
        self.desc = desc
        self.time = time
        self.location = location
    }
    
}
