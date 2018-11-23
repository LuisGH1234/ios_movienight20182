//
//  HomeViewController.swift
//  iMovie_Night
//
//  Created by Karen Galindo on 11/23/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Table Row"

class HomeViewController: UITableViewController {

    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZGQiOjcxLCJzdWIiOiJDZXNhckNhc0Bob3RtYWlsLmNvbSIsInB3ZCI6Im1pdXBjLjQ1Ni4iLCJwaG8iOiI5MTQ4NzI4MzMifQ.76V1nfjgq2Jk8txT_KezUwFcHaOmt_ZDW2dzviY0qS0"
    //let token = UserStore.shared.userToken
    //let user_id = UserStore.shared.userId
    var items = [HomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MovieNightApi.getHomeItems(token: token, user_id: 71, responsehandler: handleResponse)
    }
    
    private func handleResponse(response: MovieNightResponse<HomeItem>) {
        if response.status == "error" {
            print("Error in response: Requesting events")
            return
        }
        if let items = response.list {
            self.items = items
            self.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HomeCell
        row.update(from: items[indexPath.row])
        return row
    }
}
