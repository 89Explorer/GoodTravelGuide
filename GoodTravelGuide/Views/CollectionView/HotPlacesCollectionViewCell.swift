//
//  HotPlacesCollectionViewCell.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/30/24.
//

import UIKit

class HotPlacesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let identifier = "HotPlacesCollectionViewCell"
    
    
    // MARK: - UI Components
    private let placesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "church")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleAddressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        return stackView
    }()
    
    private let placesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "전주 한옥 마을"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    private let placesAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "강원특별자치도 고성군 죽왕면 공현진1리"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContentView()
        
        contentView.addSubview(placesImageView)
        contentView.addSubview(titleAddressStackView)
        
        titleAddressStackView.addArrangedSubview(placesTitleLabel)
        titleAddressStackView.addArrangedSubview(placesAddressLabel)
        
        configureConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        let placesImageViewConstraints = [
            placesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            placesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            placesImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            placesImageView.heightAnchor.constraint(equalToConstant: 130)
        ]
        
        let titleAddressStackViewConstraints = [
            titleAddressStackView.leadingAnchor.constraint(equalTo: placesImageView.leadingAnchor),
            titleAddressStackView.topAnchor.constraint(equalTo: placesImageView.bottomAnchor, constant: 10),
            titleAddressStackView.trailingAnchor.constraint(equalTo: placesImageView.trailingAnchor, constant: -10),
//            titleAddressStackView.heightAnchor.constraint(equalToConstant: 40)
           titleAddressStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ]
        
        
        NSLayoutConstraint.activate(placesImageViewConstraints)
        NSLayoutConstraint.activate(titleAddressStackViewConstraints)
    }
    
    
    
    // MARK: - Functions
    private func configureContentView() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
    }
    
    func configure(title: String, address: String) {
        placesTitleLabel.text = title
        placesAddressLabel.text = address
    }
}
