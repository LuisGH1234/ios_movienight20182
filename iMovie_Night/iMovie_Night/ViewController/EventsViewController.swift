//
//  EventsViewController.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 11/8/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Table Row"

class EventsViewController: UITableViewController {
    
    var events: [Event] = [Event]()
    var currentRow = 0
    
    let token = UserStore.shared.userToken
    let user_id = UserStore.shared.userId

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MovieNightApi.getEventsByUser(token: token, user_id: user_id, responseHandler: handleResponse, errorHandler: handleError)
    }
    
    @IBAction func back(segue: UIStoryboardSegue){}

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EventCell
        row.update(from: events[indexPath.row])
        return row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEvent" {
            //let nav = segue.destination as! UINavigationController
            //let destination = nav.topViewController as! EventViewController
            let destination = segue.destination as! EventViewController
            destination.event = events[currentRow]
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRow = indexPath.row
        self.performSegue(withIdentifier: "showEvent", sender: self)
    }
    
    private func handleResponse(response: MovieNightResponse<Event>){
        if response.status == "error" {
            print("Error in response: Requesting events")
            return
        }
        if let events = response.list {
            print(events)
            self.events = events
            self.tableView.reloadData()
        }
    }
    
    private func handleError(error: Error){
        print("Error while requesting Events: \(error.localizedDescription)")
    }
}
