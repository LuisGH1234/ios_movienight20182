//
//  MoviesTableViewController.swift
//  iMovie_Night
//
//  Created by Omar Alex on 9/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MoviesTableViewController: UITableViewController {
    var titles: [Title] = [Title]()
    var currentRow = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         OmdbApi.getSearch(apikey: "deb5b9ed", word: "Marvel", responseHandler: handleResponse, errorHandler: handleError)
    }
    
    func handleResponse(response: SearchResponse) {
        if response.Response == "error" {
            print("Error in response: \(response.Response)")
        }
        if let titles = response.Search {
            self.titles = titles
            self.tableView.reloadData()
        }
        print("Titles count: \(response.totalResults)")
        
    }
    
    func handleError(error: Error) {
        print("Error while requesting Titles: \(error.localizedDescription)")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MovieCell
        row.update(from: titles[indexPath.row])
        return row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlaylist" {
            let destination = segue.destination as! MovieViewController
            destination.titleu = titles[currentRow]
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRow = indexPath.row
        self.performSegue(withIdentifier: "showPlaylist", sender: self)
    }
    
}


