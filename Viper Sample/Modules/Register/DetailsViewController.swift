//
//  RegisterViewController.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import UIKit

final class DetailsViewController: UIViewController, DetailsPresenterDelegate {
    
    var presenter: DetailsPresenter!
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.isHidden = true
        lblDescription.isHidden = true
        imgMovie.isHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.loadData(data: presenter.movies!)
    }

    func loadedData() {
        
        guard let movie = presenter.data?.results.first else { return }
        
        lblTitle.text = movie.original_title
        lblDescription.text = movie.overview
        
        let urlString =  Constants.API.ImageURL + movie.poster_path!
        
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else { return }
        
        imgMovie.image = UIImage(data: data)
        
        lblTitle.isHidden = false
        lblDescription.isHidden = false
        imgMovie.isHidden = false
        animateConstraints()
    }
    
    func animateConstraints() {
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
