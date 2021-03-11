//
//  DetailViewController.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 12/03/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Detail Page"

    }


}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
        return cell
    }
    
    
}
