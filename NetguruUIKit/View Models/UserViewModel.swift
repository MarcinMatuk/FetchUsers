//
//  UserViewModel.swift
//  NetguruUIKit
//
//  Created by Marcin Matuk on 10/02/2022.
//

import Foundation

struct UserListViewModel {
    let users: [Users]
}

extension UserListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.users.count
    }
    
    func userAtIndex(_ index: Int) -> UserViewModel {
        let user = self.users[index]
        return UserViewModel(user)
    }
    
}

struct UserViewModel {
    private let user: Users
}

extension UserViewModel {
    init(_ name: Users) {
        self.user = name
    }
}

extension UserViewModel {
    var first: String {
        return self.user.name.first
    }
    
    var last: String {
        return self.user.name.last
    }
    
    var thumbnail: String {
        return self.user.picture.thumbnail
    }
}

