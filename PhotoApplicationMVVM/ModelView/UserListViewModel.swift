//
//  UserListViewModel.swift
//  PhotoApplecationMVVM
//
//  Created by Rufan Abdurahmanov on 20.10.21.
//

import Foundation


struct UserListViewModel {
    
    let UserList : [UserData]
    
    
    func numberOfRowsInSection () -> Int {
        return self.UserList.count
    }
    
    
    func userAtIndex (_ index : Int) -> UserViewModel {
        
        let user = self.UserList[index]
        return UserViewModel(userViewModel: user)
    }
    
    
}

struct UserViewModel {
    
    let userViewModel : UserData
    
    var id: Int {
        return userViewModel.id
    }
    var userName : String {
        return userViewModel.username
    }
    var name : String {
        return userViewModel.name
    }
    
    
    
}
