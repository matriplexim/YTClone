//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Максим Ломакин on 17.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        model.getVideos()
    }


}

