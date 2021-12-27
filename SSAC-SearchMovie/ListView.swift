//
//  ListView.swift
//  SSAC-SearchMovie
//
//  Created by mac on 2021/12/22.
//

import UIKit

class ListView : UIView {
    
    let SearchBar = UISearchBar()
    
    let subTitleLabel = UILabel()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
  
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        configure()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(){
        SearchBar.placeholder = "검색"
        subTitleLabel.tintColor = .black
         collectionView.backgroundColor = .black
        
    }
    
    func setupConstraints(){
       
        addSubview(SearchBar)
        addSubview(subTitleLabel)
        addSubview(collectionView)
        
        SearchBar.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(24)
        }
        
        subTitleLabel.snp.makeConstraints{
            $0.top.equalTo(SearchBar.snp.bottom).offset(12)
            $0.leading.equalTo(SearchBar)
            $0.trailing.equalTo(SearchBar)
            $0.height.equalTo(SearchBar)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        func flowLayout() {
                let layout = UICollectionViewFlowLayout()
                let spacing: CGFloat = 8
                let width = UIScreen.main.bounds.width - (spacing * 4)
                let height = UIScreen.main.bounds.height - (spacing * 5)
                layout.itemSize = CGSize(width: width / 3, height: height / 4 )
                layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
                layout.minimumInteritemSpacing = spacing
                layout.minimumLineSpacing = spacing
                layout.scrollDirection = .vertical
                collectionView.collectionViewLayout = layout
            }
    
  }
}
