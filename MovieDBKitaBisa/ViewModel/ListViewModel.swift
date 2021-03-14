//
//  ListViewModel.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 12/03/21.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

class ListViewModel{
    var networkProvider = NetworkManager()
    var movieData = BehaviorRelay<[Movies]>(value: [])
    

    
    func fetchPopular(){
        networkProvider.getPopularMovies(page: 1) { [self] (movies) in
            movieData.accept(movies)
            
        }
        
    }
    
    func fetchNowPlaying(){
        networkProvider.getNowPlaying(page: 1) { [self](movies) in
            movieData.accept(movies)
        }
    }
    func fetchTopRated(){
        networkProvider.getTopRated(page: 1) { [self](movies) in
            movieData.accept(movies)
        }
    }

    
}
