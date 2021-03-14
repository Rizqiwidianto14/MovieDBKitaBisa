//
//  ViewController.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 10/03/21.
//

import UIKit
import RxSwift
import RxCocoa

class ListViewController: UIViewController {
    @IBOutlet var listTableView: UITableView!
    var viewModel = ListViewModel()
    private var disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setUpTableView()
        
        
    }
    
    func setUpTableView(){
        self.viewModel.fetchPopular()
        self.viewModel.movieData.bind(to: listTableView.rx.items(cellIdentifier: "ListCell", cellType: ListTableViewCell.self)){row,toplist,cell in
            cell.preparation(toplist)
        }.disposed(by: disposeBag)
        listTableView.estimatedRowHeight = listTableView.rowHeight
        listTableView.rowHeight = UITableView.automaticDimension
        
        listTableView
            .rx
            .itemSelected
            .subscribe(onNext:{ indexPath in
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                detailViewController.viewModel.idListData = self.viewModel.movieData.value[indexPath.row].id
                self.navigationController?.pushViewController(detailViewController, animated: true)
            }).disposed(by: disposeBag)
        
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
            self.viewModel.fetchPopular()
        }))
        actionSheet.addAction(UIAlertAction(title: "Top Rated", style: .default, handler: { (action) in
      
            self.viewModel.fetchTopRated()
        }))
        actionSheet.addAction(UIAlertAction(title: "Now Playing", style: .default, handler: { (action) in

            self.viewModel.fetchNowPlaying()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
}


