//
//  FavoriteViewController.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 12/03/21.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet var favoriteTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Favorite Page"

    }

}

extension FavoriteViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteTableViewCell
        return cell
    }
    
    
}
