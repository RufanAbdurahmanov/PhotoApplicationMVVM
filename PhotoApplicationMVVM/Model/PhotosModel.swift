//
//  PhotosModel.swift
//  PhotoApplicationMVVM
//
//  Created by Rufan Abdurahmanov on 23.10.21.
//

import Foundation


struct PhotoData : Decodable {
    
    let albumId : Int
    let id : Int
    let url : String
    let thumbnailUrl : String
    
}
