//
//  DetailTableViewCell.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 12/03/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func preparation(_ data: MovieDetail){
        titleLabel.text = data.originalTitle
        dateLabel.text = data.releaseDate
        descLabel.text = data.overview
        let urlString = ("https://image.tmdb.org/t/p/w500\(data.posterPath)")
        let url = URL(string: urlString)
        self.fetchImage(from: url!) { (image) in
            self.movieImage.image = image
        }
    }

    
    func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void){
        DispatchQueue.global(qos: .background).async {
            let session = URLSession(configuration: .default)
            DispatchQueue.global(qos: .background).async {
                session.dataTask(with: URLRequest(url: url)) { data, response, error in
                    if error != nil {
                        print(error?.localizedDescription ?? "Unknown error")
                    }
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            completion(image)
                        }
                    }
                }.resume()
            }
        }

    }


}
