//
//  Users.swift
//  NetguruUIKit
//
//  Created by Marcin Matuk on 10/02/2022.
//

import Foundation
import UIKit

struct UsersList: Codable {
    let results: [Users]
}

struct Users: Codable {
    let name: Name
    let phone: String
    let gender: String
    let email: String
    let nat: String
    let picture: Picture
    let location: Location
    
    struct Name: Codable {
        let first: String
        let last: String
    }
    
    struct Picture: Codable {
        let thumbnail: String
    }
    
    struct Location: Codable {
        let coordinates: Coordinates
    }
    
    struct Coordinates: Codable {
        let latitude: String
        let longitude: String
    }
}
