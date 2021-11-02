//
//  WebServiceUser.swift
//  PhotoApplecationMVVM
//
//  Created by Rufan Abdurahmanov on 20.10.21.
//

import Foundation

class WebService {
    
    func downloadUserAPI (url : URL, completion:  @escaping ([UserData]?) -> () )  {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                
                let userList = try? JSONDecoder().decode([UserData].self, from: data)
                
                if let userList = userList{
                    
                    //print(userList)
                    completion(userList)
                    
                }
            }
            
        }.resume()
        
        
    }
    
    
    func downloadAlbumAPI (url : URL, completion: @escaping ([AlbumData]?) -> ()  ) {
        
        URLSession.shared.dataTask(with: url) { data , response , error  in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            else if let data = data {
                let albumList = try? JSONDecoder().decode([AlbumData].self, from: data)
                
                if let albumList = albumList {
                    completion(albumList)
                }
            }
            
        }.resume()
        
        
    }
    
    
    
    func downloadPhotoAPI (url: URL, completion: @escaping ([PhotoData]?) -> ()  ) {
        
        URLSession.shared.dataTask(with: url) { data , response , error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            else if let data = data {
                let photoList = try? JSONDecoder().decode([PhotoData].self, from: data)
                
                if let photoList = photoList {
                    completion(photoList)
                    print(photoList)
                }
                
            }
            
        }.resume()
        
    }
    
    
}
