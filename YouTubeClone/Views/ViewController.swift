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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        let detailVC = segue.destination as! DetailViewController
        detailVC.video = selectedVideo
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate, ModelPresenterDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        cell.setCell(self.videos[indexPath.row])
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
