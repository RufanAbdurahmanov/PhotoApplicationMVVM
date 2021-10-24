//
//  ThirdViewController.swift
//  PhotoApplicationMVVM
//
//  Created by Rufan Abdurahmanov on 23.10.21.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private var photoListViewModel : PhotoListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        //getData()
    }
    

    func getData () {
        
        let url = URL(string: "​https://jsonplaceholder.typicode.com/photos/")!
        
        WebService().downloadPhotoAPI(url: url) { photos in
            
            if let photos = photos {
                self.photoListViewModel = PhotoListViewModel.init(PhotoList: photos)
            }
            
            DispatchQueue.main.async {
                //tableView.reloadData()
                
            }
            
        }
        
    }
    
    

}
