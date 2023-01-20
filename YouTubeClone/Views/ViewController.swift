//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Максим Ломакин on 17.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let presenter = Presenter()
    private var videos = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter.setViewDelegate(delegate: self)
        presenter.getData()
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate, ModelPresenterDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
        cell.textLabel?.text = self.videos[indexPath.row].snippet.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func presentData(data: [Item]) {
        self.videos = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentAlert(title: String, message: String) {
        
    }
    
 
}
