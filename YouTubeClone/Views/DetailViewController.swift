//
//  DetailViewController.swift
//  YouTubeClone
//
//  Created by Максим Ломакин on 20.01.2023.
//
//https://www.youtube.com/watch?v=EJQW864XpmA

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var video: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = ""
        dateLabel.text = ""
        descriptionTextView.text = ""
        
        guard video != nil else {
            return
        }
        guard let watchURL = URL(string: "https://www.youtube.com/embed/\(video!.snippet.resourceID.videoID)") else {
            print("Wrong watching URL")
            return
        }
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: watchURL))
        }
        titleLabel.text = video?.snippet.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.snippet.publishedAt)
        descriptionTextView.text = video?.snippet.description
    }
    
}
