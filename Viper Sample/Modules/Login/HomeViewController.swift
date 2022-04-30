//
//  HomeViewController.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import UIKit

final class HomeViewController: UIViewController,
                                HomePresenterDelegate,
                                UICollectionViewDelegate,
                                UICollectionViewDataSource {
  
    var presenter: HomePresenter!
    
    @IBOutlet weak var cvMovies: UICollectionView!
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.loadData()

    }

    func loadedData() {
        print(presenter.data!)
        cvMovies.reloadData()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Collection View Delegate
    //-----------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let count = presenter.data?.results.count else { return 0 }
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.loadUI(presenter.data!, index: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.showDetails(presenter.data!, index: indexPath.row, data: (presenter.data?.results[indexPath.row])!)
    }
}
