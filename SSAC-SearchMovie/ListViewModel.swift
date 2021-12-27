//
//  ListModel.swift
//  SSAC-SearchMovie
//
//  Created by mac on 2021/12/22.
//

import UIKit

class ListViewModel {
    var api = APIService()
    var ListData: TMDB?
    
    var searchBarTitle: String = "Search Movie"

    var subTitle: String = "영화 및 TV프로그램"
    
}

extension ListViewModel: CollectionViewCellRepresentable {
    
  
    
    var numberOfItemsInSection: Int {
        return ListData?.results.count ?? 0
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
    
    
    

