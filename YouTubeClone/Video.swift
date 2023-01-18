//
//  Video.swift
//  YouTubeClone
//
//  Created by Максим Ломакин on 18.01.2023.
//

import Foundation

struct Video: Codable, Identifiable {
    
    var id: String
    var videoId: String
    var title: String
    var description: String
    var thumbnail: String
    var published: String
    
}
