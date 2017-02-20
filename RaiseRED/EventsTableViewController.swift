//
//  EventsTableViewController.swift
//  RaiseRED
//
//  Created by Bradley Hoffman on 12/4/16.
//  Copyright © 2016 Create. All rights reserved.
//

import UIKit
import Material
import Firebase

class EventsTableViewController: UITableViewController {
    
    @IBOutlet var eventsTableView: UITableView!
    let cardHeight : CGFloat = 345
    let cardWidth : CGFloat = 375
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        let label = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(150), height: CGFloat(36)))
        label.backgroundColor = UIColor.clear
        label.shadowColor = UIColor(white: CGFloat(0.0), alpha: CGFloat(0.5))
        label.textAlignment = .left
        label.attributedText = "<font color=\"white\" face=\"futura\" size = \"30\">EVEN</font> <font color=\"#f50002\" face=\"futura\" size = \"30\">TS</font>".attributedStringFromHtml
        let backButton = UIBarButtonItem(customView: label)
        self.navigationItem.leftBarButtonItem = backButton
        // Load events
        observeEvents()
    }
    
    
    // MARK: Events Data
    
    var events = [Event]()
    let ref: FIRDatabaseReference = FIRDatabase.database().reference()
    var newEventRefHandle: FIRDatabaseHandle?
    var updatedEventRefHandle: FIRDatabaseHandle?
    
    func observeEvents() {
        // Load event when one gets written to DB
        let eventRef = self.ref.child("events")
        let eventsQuery = eventRef.queryLimited(toLast:50)
        
        self.newEventRefHandle = eventsQuery.observe(.childAdded, with: { (snapshot) -> Void in
            let eventData = snapshot.value as! Dictionary<String, String>
            
            if let imgId = eventData["imgId"] as String!,
                let title = eventData["title"] as String!,
                let desc = eventData["desc"] as String!,
                let location = eventData["location"] as String!,
                let time = eventData["time"] as String! {
                print("Observing event\n\tkey: \(snapshot.key)")
                
                let e = Event(imgId: imgId, title: title, desc: desc, time: time, location: location)
                
                self.events.append(e!)
                self.tableView?.reloadData()
                
            } else {
                print("Error! Could not decode new event data")
            }
        })
        
        // Event Updates
        self.updatedEventRefHandle = eventRef.observe(.childChanged, with: { (snapshot) in
            let eventData = snapshot.value as! Dictionary<String, String>
            
            if let imgId = eventData["imgId"] as String!,
                let title = eventData["title"] as String!,
                let desc = eventData["desc"] as String!,
                let location = eventData["location"] as String!,
                let time = eventData["time"] as String! {
                print("Observing event\n\tkey: \(snapshot.key)")
                
                let e = Event(imgId: imgId, title: title, desc: desc, time: time, location: location)
                
                for (idx, event) in self.events.enumerated() {
                    if (event.title == title && event.time == time) {
                        print("Updating event, title: \(event.title)")
                        self.events[idx] = e!
                    }
                }
                
                self.tableView?.reloadData()
                
            } else {
                print("Error! Could not decode updated event data")
            }
        })
    }
    
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let event = events[indexPath.row]
        
        let eventCard = ImageCard()
        let imageView = UIImageView()
        imageView.image = UIImage(named: event.imgId)?.resize(toWidth: cardWidth)
        
        eventCard.imageView = imageView
        
        let timeLbl = UILabel()
        timeLbl.numberOfLines = 0
        timeLbl.text = event.time
        
        eventCard.toolbar = Toolbar()
        eventCard.toolbarEdgeInsetsPreset = .square3
        
        eventCard.toolbar?.title = event.title
        eventCard.toolbar?.detail = event.desc
        
        eventCard.frame.size.width = UIScreen.main.bounds.width - 10
        eventCard.frame.size.height = (((imageView.image?.height)!) * ((UIScreen.main.bounds.width - 10) / 375))
        
        cell.contentView.addSubview(eventCard)
        
        return cell
    }
    
    
}
