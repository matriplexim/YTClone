//
//  VideoTableViewCell.swift
//  YouTubeClone
//
//  Created by Максим Ломакин on 20.01.2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Item?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ video: Item) {
        
        self.video = video
        self.titleLabel.text = video.snippet.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video.snippet.publishedAt)
        guard let url = URL(string: video.snippet.thumbnails.maxres.url) else {
            print("Wrong URL for thumbnails")
            return
        }
        if let cachedData = CacheManager.getVideoCache(video.snippet.thumbnails.maxres.url) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                print("Wrong session for thumbnails")
                return
            }
            CacheManager.setVideoCache(url.absoluteString, data)
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.thumbnailImageView.image = image
            }
        }
        dataTask.resume()
    }

}
