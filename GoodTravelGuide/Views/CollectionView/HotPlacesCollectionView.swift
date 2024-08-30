//
//  HotPlacesCollectionView.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/30/24.
//

import UIKit

class HotPlacesCollectionView: UIView {
    
    // MARK: - UI Components
    private let hotPlacesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 180, height: 200)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(hotPlacesCollectionView)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        let hotPlacesCollectionViewConstraints = [
            hotPlacesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hotPlacesCollectionView.topAnchor.constraint(equalTo: topAnchor),
            hotPlacesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hotPlacesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(hotPlacesCollectionViewConstraints)
    }
    
    
    // MARK: - Functions
    func getHotPlacesCollectionView() -> UICollectionView {
        return hotPlacesCollectionView
    }
    
}
