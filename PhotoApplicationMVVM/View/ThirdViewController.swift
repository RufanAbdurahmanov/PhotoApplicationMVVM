//
//  ThirdViewController.swift
//  PhotoApplicationMVVM
//
//  Created by Rufan Abdurahmanov on 23.10.21.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedAlbumID: Int!
    
    private var photoListViewModel : PhotoListViewModel!
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.title = "Photos"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        
        //print(selectedAlbumID)
        
        //let x: Int =  self.photoListViewModel.photosInSection(albumID: selectedAlbumID).count
        //print ( x )

        self.getData()
    }
    

    func getData () {
        
        let url = URL(string: "​https://jsonplaceholder.typicode.com/photos/")!
        
        WebService().downloadPhotoAPI(url: url) { photoList in
            
            if let photoList = photoList {
                self.photoListViewModel = PhotoListViewModel.init(PhotoList: photoList)
            }
            
            DispatchQueue.main.async {

                self.collectionView.reloadData()
            }
        }
        
    }
    
 
    

}


extension ThirdViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
    
    
       
    
    
}
