//
//  PhotoListViewModel.swift
//  PhotoApplicationMVVM
//
//  Created by Rufan Abdurahmanov on 23.10.21.
//

import Foundation



struct PhotoListViewModel {
    
    
    let PhotoList : [PhotoData]
    
    
    
    
    
    
    
    
    
    
    
    
}






struct PhotoViewModel {
    
    let photoViewModel: PhotoData
    
    
    var albumId : Int {
        return self.photoViewModel.albumId
    }
    var id : Int {
        return self.photoViewModel.id
    }
    var url : String {
        return self.photoViewModel.url
    }
    var thumbnailUrl : String {
        return self.photoViewModel.thumbnailUrl
    }
    
    
}
