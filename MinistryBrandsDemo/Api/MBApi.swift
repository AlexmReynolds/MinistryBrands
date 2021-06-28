//
//  MBApi.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import Foundation

class MBApi {
    static let shared = MBApi()
    
    func login(username:String, password:String, completion: @escaping ((Result<MBUser, Error>)->Void)) -> Void {
        //validate and then call.
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline:DispatchTime.now() + 2.0) {
            let user = MBUser(firstName: "Alex", lastName: "Reynolds", age: 35, street: "123 ne 123st", city: "Phoenix", state: "AK", postCode: "84632")
            user.settings = MBUserSettings()
            user.settings?.isAwesomeModeEnabled = true
            completion(.success(user))
        }
    }
    func getUsers(completion: @escaping ((Result<[MBUser], Error>)->Void)) -> Void {
        guard let url = URL(string: "https://mfwebassets.s3.amazonaws.com/MBUsers.json") else {
            let users = self.getMockedUsers()
            completion(.success(users))
            return
        }
        
        //Quick and dirty API call. Things like base URLs and Components for Requests would be better. A library would be useful for a more complex call
        DispatchQueue.global(qos: .background).async {
            
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let parsed = try decoder.decode(MBUserWebObjectResponse.self, from: data)
                        var users = [MBUser]()
                        if let webUsers = parsed.users {
                            for webObject in webUsers {
                                users.append(MBUser.convert(webObject: webObject))
                            }
                        }
                        completion(.success(users))
                    } catch let error {
                        print("coding error \(error)")
                        completion(.failure(error))
                    }
                } else if let err = error {
                    completion(.failure(err))

                } else {
                    //some error
                    let error = NSError(domain: "com.alexreynolds.demo", code: 500, userInfo: nil)
                    completion(.failure(error))

                }
            }.resume()
        }
    }
    
    
    private func getMockedUsers() -> [MBUser] {
        return [
            MBUser(firstName: "John", lastName: "Doe", age: 26, street: "175 S 15th St", city: "Denver", state: "CO", postCode: "80128"),
            MBUser(firstName: "James", lastName: "Johnson", age: 29, street: "423 W 17th St", city: "Denver", state: "CO", postCode: "80128"),
            MBUser(firstName: "Kevin", lastName: "Clarkson", age: 27, street: "9846 S 32nd St", city: "Denver", state: "CO", postCode: "80128"),
            MBUser(firstName: "Carl", lastName: "Weathers", age: 56, street: "9873 N 15th St", city: "Denver", state: "CO", postCode: "80128"),
            MBUser(firstName: "John", lastName: "Johnson", age: 33, street: "9273 SE 11th St", city: "Denver", state: "CO", postCode: "80128"),
        ]
    }
}
