//
//  FriendsViewController.swift
//  iMovie_Night
//
//  Created by Omar Alex on 16/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriendsViewController: UITableViewController {
    
    var friends: [Friend] = [Friend]()
    var currentRow = 0
    
 //   let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZGQiOjcxLCJzdWIiOiJDZXNhckNhc0Bob3RtYWlsLmNvbSIsInB3ZCI6Im1pdXBjLjQ1Ni4iLCJwaG8iOiI5MTQ4NzI4MzMifQ.76V1nfjgq2Jk8txT_KezUwFcHaOmt_ZDW2dzviY0qS0"
 //   let user_id = 71
    let token = UserStore.shared.userToken
    let user_id = UserStore.shared.userId
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieNightApi.getListFriends(token: token, user_id: user_id, responseHandler: handleResponse, errorHandler: handleError)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }
    
    private func handleResponse(response: MovieNightResponse<Friend>){
        if response.status == "error" {
            print("Error in response: Requesting Friend")
            return
        }
        if let friends = response.list {
            print(friends)
            self.friends = friends
            self.tableView.reloadData()
        }
    }
    
    private func handleError(error: Error){
        print("Error while requesting Friends: \(error.localizedDescription)")
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FriendCell
        cell.update(from: friends[indexPath.row])
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
