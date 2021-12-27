//
//  CollectionView+Extension.swift
//  SSAC-SearchMovie
//
//  Created by mac on 2021/12/22.
//

import Foundation
import UIKit
import SnapKit

protocol ReuseableView {
    static var resuseIdentifier : String { get }
}

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            loadLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
    
    func loadLayout() {
        
        self.backgroundColor = .black
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}



extension UICollectionViewCell {
    
    static var reuseIdentifier : String {
        return String(describing: self)
    }
    
}
