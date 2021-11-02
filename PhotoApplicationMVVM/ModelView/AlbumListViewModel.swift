//
//  AlbomListViewModel.swift
//  PhotoApplicationMVVM
//
//  Created by Rufan Abdurahmanov on 22.10.21.
//

import Foundation



struct AlbumListViewModel {
    
    let AlbumList : [AlbumData]
    
    
    
    
    func numberOfRowsInSection (count : Int) -> Int {
        
        var cellCount = 0
        
        for id in AlbumList {
            if count == id.userId {
                cellCount += 1
            }
        }
        return cellCount
    }
    

    func cellData ( chosenId : Int) -> Array<AlbumData> {
        
        let albums = AlbumList
        
        var albumArray = [AlbumData]()
        
        for album in albums {
            if album.userId == chosenId {
                albumArray.append(album)
            }
        }
         
        return albumArray
    }
    
    
}



struct AlbumViewModel {
    
    let albumViewModel : AlbumData
    
    var userId: Int {
        return self.albumViewModel.userId
    }
    
    var id : Int {
        return self.albumViewModel.id
    }
    
    var title : String {
        return self.albumViewModel.title
    }
    
    
}
