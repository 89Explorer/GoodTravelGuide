//
//  CategoryTableViewCell.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/28/24.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    static let identifier = "CategoryTableViewCell"
    var buttonTitles = ["인문", "역사관광지", "해수욕장"]
    
    
    
    // MARK: - UI Components
    private let basicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "church")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "명사해수욕장"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "경상남도 거제시 남부면 명사해수욕장길"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        
        contentView.addSubview(basicView)
        basicView.addSubview(mainImageView)
        basicView.addSubview(titleStackView)
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(addressLabel)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        let basicViewConstraints = [
            basicView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            basicView.topAnchor.constraint(equalTo: contentView.topAnchor),
            basicView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        let mainImageViewConstraints = [
            mainImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainImageView.heightAnchor.constraint(equalToConstant: 140),
            mainImageView.widthAnchor.constraint(equalToConstant: 140)
        ]
        
        let titleStackViewConstraints = [
            titleStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleStackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15),
            titleStackView.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 5),
            
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(mainImageViewConstraints)
        NSLayoutConstraint.activate(titleStackViewConstraints)
    }
    
    
    
    // MARK: - Functions
    func createCustomButton(withTitle title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = .darkOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return button
    }
}
