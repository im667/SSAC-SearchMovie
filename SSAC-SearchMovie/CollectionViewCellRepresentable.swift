//
//  CollectionViewCellRepresentable.swift
//  SSAC-SearchMovie
//
//  Created by mac on 2021/12/22.
//

import Foundation
import UIKit

protocol CollectionViewCellRepresentable {
    
    var numberOfItemsInSection: Int { get }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
}
