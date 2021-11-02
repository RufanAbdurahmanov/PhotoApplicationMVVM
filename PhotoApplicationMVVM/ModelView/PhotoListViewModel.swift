//
//  PhotoListViewModel.swift
//  PhotoApplicationMVVM
//
//  Created by Rufan Abdurahmanov on 23.10.21.
//

import Foundation



struct PhotoListViewModel {
    
    
    let PhotoList : [PhotoData]!
    
    
    
    func numberOfItemsInSection () -> Int {
        return 50
    }
    
    
    
    func photosInSection (albumID: Int) -> [PhotoData] {
        
        var photos = [PhotoData]()
        
        for album in PhotoList {
            if album.albumId == albumID {
                photos.append(album)
            }
        }
        
        return photos
    }
    
    
    
    
    
}






struct PhotoViewModel {
    
    let photoViewModel: PhotoData
    
    
    var albumId : Int {
        return self.photoViewModel.albumId
    }
    var id : Int {
        return self.photoViewModel.id
    }
    var title : String {
        return self.photoViewModel.title
    }
    var url : String {
        return self.photoViewModel.url
    }
    var thumbnailUrl : String {
        return self.photoViewModel.thumbnailUrl
    }
    
    
}
