//
//  DetailViewController.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 12/03/21.
//

import UIKit
import RxSwift
import RxCocoa


class DetailViewController: UIViewController {
    @IBOutlet var detailTableView: UITableView!
    var viewModel = DetailViewModel()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Detail Page"
        setUpTableView()

    }
    
    func setUpTableView(){
        self.viewModel.fetchDetail()
        self.viewModel.movieDetail.bind(to: detailTableView.rx.items(cellIdentifier: "DetailCell", cellType: DetailTableViewCell.self)){row,detail,cell in
            cell.preparation(detail)
        }.disposed(by: disposeBag)
        detailTableView.estimatedRowHeight = detailTableView.rowHeight
        detailTableView.rowHeight = UITableView.automaticDimension
        
    }

    @IBAction func favoriteButton(_ sender: UIButton) {
        
    }
}

