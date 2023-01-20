//
//  Presenter.swift
//  YouTubeClone
//
//  Created by Максим Ломакин on 19.01.2023.
//

import Foundation
import UIKit

protocol ModelPresenterDelegate: AnyObject {
    func presentData(data: [Item])
    func presentAlert(title: String, message: String)
}

typealias PresenterDelegate = ModelPresenterDelegate & UIViewController

class Presenter {
    
    let model = Model()
    
    weak var delegate: PresenterDelegate?
    
    public func getData() {
        model.getVideos { data in
            self.delegate?.presentData(data: data.items)
        }
    }
    
    public func setViewDelegate(delegate: PresenterDelegate){
        self.delegate = delegate
    }
}
