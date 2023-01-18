//
//  Model.swift
//  YouTubeClone
//
//  Created by Максим Ломакин on 18.01.2023.
//

import Foundation

class Model {
    
    func getVideos() {
        guard let url = URL(string: Constants.API_URL) else {
            print("Wrong URL")
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try JSONDecoder().decode(Video.self, from: data)
                print(response)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
//
//class UsersRepository {
//    func getUsers(complitionHandler: @escaping ([User]) -> Void) {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
//            return
//
//        }
//       let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//
//            }
//
//            do {
//                let response = try JSONDecoder().decode([User].self, from: data)
//                complitionHandler(response)
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//    }
//}
