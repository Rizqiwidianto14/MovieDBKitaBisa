//
//  DetailViewModel.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 13/03/21.
//

import Foundation
import RxSwift
import RxCocoa
import Moya


class DetailViewModel{
    var networkProvider = NetworkManager()
    var movieDetail = BehaviorRelay<[MovieDetail]>(value: [])
    var idListData = Int()

    
    func fetchDetail(){
        networkProvider.getMovieDetail(id: idListData) { (detail) in
            var value = self.movieDetail.value
            value.append(detail)
            self.movieDetail.accept(value)
        }
    }
    
}
