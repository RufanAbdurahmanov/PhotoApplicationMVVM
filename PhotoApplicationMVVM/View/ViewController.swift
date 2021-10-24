//
//  ViewController.swift
//  PhotoApplecationMVVM
//
//  Created by Rufan Abdurahmanov on 20.10.21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var userListViewModel : UserListViewModel!
    
     var  tappedId : Int!

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        
        getData()
        
    }
    
    
    
    
    func getData (){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/")!
        
        WebService().downloadUserAPI(url: url) { users in
            if let users = users {
                
                self.userListViewModel = UserListViewModel(UserList: users)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    

    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userListViewModel == nil ? 0 : userListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
        
        cell.usernameLabel.text = "@\(self.userListViewModel.userAtIndex(indexPath.row).userName)"
        cell.nameLabel.text = self.userListViewModel.userAtIndex(indexPath.row).name
        cell.backgroundColor = .clear
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tappedId = self.userListViewModel.UserList[indexPath.row].id
        self.performSegue(withIdentifier: "toSecondViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondViewController"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.tappedUserId = tappedId
        
        }
    }
    

}




