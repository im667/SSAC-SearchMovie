//
//  ListViewController.swift
//  SSAC-SearchMovie
//
//  Created by mac on 2021/12/22.
//

import Foundation
import SnapKit
import UIKit

class ListViewController : BaseViewController {
    
    var api = APIService()
    var ListData: TMDB?
    var mainView = ListView()
    var ViewModel = ListViewModel()
 
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
   
        
        
        api.requestCast { tmdb in
            self.ListData = tmdb
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func configure() {
        mainView.subTitleLabel.text = "영화 및 TV프로그램"
    }
    
    override func setupConstraints() {
        print(#function)
    }
    
   
}

extension ListViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ViewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
                    return UICollectionViewCell()
                }
        
                let row = ListData?.results[indexPath.item]
                let url = URL(string: Endpoint.tmdbPosterURL + row!.posterPath)

                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        cell.imageView.image = UIImage(data: data!)
                        
                    }
                }
                
                return cell
            }
    
}
     
    
    

