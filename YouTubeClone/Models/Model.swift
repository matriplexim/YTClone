//
//  Model.swift
//  YouTubeClone
//
//  Created by Максим Ломакин on 18.01.2023.
//

import Foundation

class Model {
    func getVideos(completionHandler: @escaping (Video) -> Void) {
        guard let url = URL(string: Constants.API_URL) else {
            print("Wrong URL")
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else {
                print("Wrong session")
                return
            }
            do {
                let decoder = try JSONDecoder().decode(Video.self, from: data)
                completionHandler(decoder)
            } catch {
                print("Error response is \(error)")
            }
        }
        task.resume()
    }
}
