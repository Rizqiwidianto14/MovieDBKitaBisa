//
//  ViewController.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 10/03/21.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       setNavigationBar()
        
    }
    
    func setNavigationBar(){
        let image = UIImage(systemName: "heart.fill")
        navigationItem.title = "List Page"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(toFavoriteController(sender:)))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc private func toFavoriteController(sender: UIViewController){
        print("Favorite")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let favoriteViewController = storyBoard.instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
        self.navigationController?.pushViewController(favoriteViewController, animated: true)


    }
    
    @IBAction func categoryButton(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Select Category", message: "Select Category To See", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Popular", style: .default, handler: { (action) in
            print("Popular")
        }))
        actionSheet.addAction(UIAlertAction(title: "Upcoming", style: .default, handler: { (action) in
            print("Upcoming")
        }))
        actionSheet.addAction(UIAlertAction(title: "Top Rated", style: .default, handler: { (action) in
            print("Top Rated")
        }))
        actionSheet.addAction(UIAlertAction(title: "Now Playing", style: .default, handler: { (action) in
            print("Now Playing")
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)

    }
    

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
}
