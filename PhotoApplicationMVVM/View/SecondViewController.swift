//
//  SecondViewController.swift
//  PhotoApplicationMVVM
//
//  Created by Rufan Abdurahmanov on 22.10.21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var SecondTableView: UITableView!
    
    var tappedAlbumID : Int!
    
    var tappedUserId : Int!
    
    private var albumListViewModel : AlbumListViewModel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Albums"
        
        SecondTableView.delegate = self
        SecondTableView.dataSource = self
        view.addSubview(SecondTableView)
        
        getData()
    }
    
    
    func getData (){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/albums/")!
        
        WebService().downloadAlbumAPI(url: url) { albums in
            
            if let albums = albums {
                self.albumListViewModel = AlbumListViewModel.init(AlbumList: albums)
            }
            DispatchQueue.main.async {
                self.SecondTableView.reloadData()
            }
        }
        
        
    }

}





extension SecondViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albumListViewModel == nil ? 0 : self.albumListViewModel.numberOfRowsInSection(count: tappedUserId)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = self.albumListViewModel.cellData(chosenId: tappedUserId)[indexPath.row].title
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tappedAlbumID = ((tappedUserId - 1) * 10) + self.albumListViewModel.AlbumList[indexPath.row].id
        //print(tappedAlbumID)
        self.performSegue(withIdentifier: "toThirdViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdViewController" {
            let destinationVC = segue.destination as! ThirdViewController
            destinationVC.selectedAlbumID = tappedAlbumID
        }
    }
    
}
