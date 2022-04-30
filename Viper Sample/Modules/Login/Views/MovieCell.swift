//
//  MovieCell.swift
//  Viper Sample
//
//  Created by Paulo Danilo Conceição Lima on 10/03/22.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet private var imgView: UIImageView!
    @IBOutlet private var lblTitle: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func loadUI(_ object: MovieData, index: Int){
        
        lblTitle.text = object.results[index].original_title
        
        let urlString = Constants.API.ImageURL + object.results[index].poster_path!
        
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else { return }
        
        imgView.image = UIImage(data: data)
    }
    
    
        
        
    
    
}
