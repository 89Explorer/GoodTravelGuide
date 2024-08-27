//
//  CategoryCollectionViewCell.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/28/24.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let identifier = "CategoryCollectionViewCell"
    
    
    // MARK: - UI Components
    private let basicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .darkestOrange
        view.clipsToBounds = true
        return view
    }()
    
    private let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(basicView)
        basicView.addSubview(categoryTitleLabel)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layouts
    private func configureConstraints() {
        let basicViewCosntraints = [
            basicView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            basicView.topAnchor.constraint(equalTo: contentView.topAnchor),
            basicView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        let categoryTitleLabelConstraints = [
            categoryTitleLabel.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            categoryTitleLabel.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
            categoryTitleLabel.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 10),
            categoryTitleLabel.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(basicViewCosntraints)
        NSLayoutConstraint.activate(categoryTitleLabelConstraints)
    }
    
    
    // MARK: - Functions
    func configure(with title: String, isSelected: Bool) {
        categoryTitleLabel.text = title
        categoryTitleLabel.textColor = isSelected ? .black : .white
    }
}
