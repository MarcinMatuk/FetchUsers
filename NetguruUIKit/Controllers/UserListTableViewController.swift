//
//  UserListTableViewController.swift
//  NetguruUIKit
//
//  Created by Marcin Matuk on 10/02/2022.
//

import Foundation
import UIKit

class UserListTableViewController: UITableViewController {
    
    private var userListVM: UserListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let url = URL(string: "https://randomuser.me/api/?results=10")!
        
        Webservice().getUsers(url: url) { results in
            
            if let results = results {
                self.userListVM = UserListViewModel(users: results)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.userListVM == nil ? 0 : self.userListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else {
            fatalError("UserTableViewCell not found")
        }
        
        let userVM = self.userListVM.userAtIndex(indexPath.row)
        
        cell.firstLabel.text = userVM.first
        cell.lastLabel.text = userVM.last
        
        
  
            
            
        let url = URL(string: "https://randomuser.me/api/portraits/men/98.jpg")
        if let data = NSData(contentsOf: url!)
        {
          //  cell.photoView?.image = UIImage(data: data as Data)
            
   //         cell.photoView?.image = UIImage(data: userVM.thumbnai)
        }
        
        
//        
//        let pictureURL = URL(string: self.thumbnail[indexPath.row])!
//        let pictureData = NSData(contentsOf: pictureURL as URL)
//        let catPicture = UIImage(data: pictureData as! Data)
//        var imageV = UIImageView()
//        imageV = cell?.viewWithTag(1) as! UIImageView
//        imageV.image = catPicture
//        
        
        
        
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showDetails", sender: self)
//    }
    
    // funkcja ktora pozwala kliknac w komorke i wyswietlic jej dane szczegolowe
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? UserDetailsViewController {
//            destination.users = users[(tableView.indexPathForSelectedRow?.row)!]
//        }
//    }
    
}



