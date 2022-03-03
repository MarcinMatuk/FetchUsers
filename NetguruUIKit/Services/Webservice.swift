//
//  Webservice.swift
//  NetguruUIKit
//
//  Created by Marcin Matuk on 10/02/2022.
//

import Foundation

class Webservice {
    
    func getUsers(url: URL, completion: @escaping ([Users]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let usersList = try? JSONDecoder().decode(UsersList.self, from: data)
                
                if usersList != nil {
                    completion(usersList?.results)
                }
            }
        }.resume()
    }
}
