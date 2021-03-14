//
//  NetworkManager.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 12/03/21.
//

import Foundation
import Moya


protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}
class NetworkManager: Network {
    static let MovieAPIKey = "40ddaf11b2dceca49d91ea17022d894c"
    let provider = MoyaProvider<MoyaEndpoints>()
    
    func getPopularMovies(page: Int, completion: @escaping ([Movies])->()){
        provider.request(.popular(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(Results.self, from: response.data)
                    completion(results.movies)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }

        }
        }
    
    func getMovieDetail(id: Int, completion: @escaping (MovieDetail)->()){
        provider.request(.movieDetail(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(MovieDetail.self, from: response.data)
                    print(result)
                    completion(results)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }

        }
        }
    
    func getNowPlaying(page: Int, completion: @escaping ([Movies]) -> ()){
        provider.request(.nowPlaying(page: page)) { (result) in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(Results.self, from: response.data)
                    completion(results.movies)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getTopRated(page: Int, completion: @escaping ([Movies]) -> ()){
        provider.request(.topRated(page: page)) { (result) in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(Results.self, from: response.data)
                    completion(results.movies)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
