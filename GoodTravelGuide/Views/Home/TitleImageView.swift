//
//  TitleImageView.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/29/24.
//

import UIKit
import SDWebImage

class TitleImageView: UIView {
    
    
    // MARK: - UI Components
    private let basicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "korea")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "전주 한옥 마을"
        label.font = .systemFont(ofSize: 20, weight: .black)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "서울특별시 종로구 익선동"
        label.font = .systemFont(ofSize: 14, weight: .black)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    private let categoryLabelStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    private let bookMarkButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .systemGray3
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .medium
        
        configuration.image = UIImage(systemName: "bookmark")
        configuration.imagePadding = 10
        configuration.imagePlacement = .top
        
        // 이미지 크기 조정
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold, scale: .medium)
        configuration.preferredSymbolConfigurationForImage = largeConfig
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(basicView)
        basicView.addSubview(titleImageView)
        basicView.addSubview(titleStackView)
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(addressLabel)
        
        addSubview(categoryLabelStack)
        
        addSubview(bookMarkButton)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        let basicViewConstraints = [
            basicView.leadingAnchor.constraint(equalTo: leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
            basicView.topAnchor.constraint(equalTo: topAnchor),
            basicView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let titleImageViewConstraints = [
            titleImageView.centerXAnchor.constraint(equalTo: basicView.centerXAnchor),
            titleImageView.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 10),
            titleImageView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            titleImageView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
            titleImageView.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        let titleStackViewConstraints = [
            titleStackView.leadingAnchor.constraint(equalTo: titleImageView.leadingAnchor),
            titleStackView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 10),
            titleStackView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
            titleStackView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let categoryLabelStackConstraints = [
            categoryLabelStack.leadingAnchor.constraint(equalTo: titleImageView.leadingAnchor),
            categoryLabelStack.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 15),
            categoryLabelStack.heightAnchor.constraint(equalToConstant: 30),
            categoryLabelStack.trailingAnchor.constraint(equalTo: titleImageView.trailingAnchor)
        ]
        
        let bookMarkButtonConstraints = [
            bookMarkButton.trailingAnchor.constraint(equalTo: titleImageView.trailingAnchor, constant: -10),
            bookMarkButton.bottomAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(titleImageViewConstraints)
        NSLayoutConstraint.activate(titleStackViewConstraints)
        NSLayoutConstraint.activate(categoryLabelStackConstraints)
        NSLayoutConstraint.activate(bookMarkButtonConstraints)
    }
    
    
    // MARK: - Functions
    func createCustomLabel(withTitle title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textColor = .white
        label.backgroundColor = .darkOrange
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 0
        return label
    }
    
    
    func createCustomButton(withTitle title: String) -> UIButton {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .darkOrange
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .medium
        
        // 텍스트 들여쓰기 설정
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        // 텍스트와 관련된 설정
        configuration.title = title
        configuration.titleAlignment = .center
        configuration.attributedTitle?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    func configureData(with model: Item) {
        
        // 기존에 추가된 라벨들을 제거
        categoryLabelStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        guard let posterPath = model.firstimage else { return }
        
        let title = model.title
        let address = model.addr1
        let firstCategory = model.cat1
        let secondCategory = model.cat2
        let thirdCategory = model.cat3
        
        guard let firstCategory = FirstCategory(rawValue: firstCategory),
              let secondCategory = SecondCategory(rawValue: secondCategory),
              let thirdCategory = ThirdCategory(rawValue: thirdCategory) else { return }
        
        let labelTitle: [String] = [firstCategory.displayName, secondCategory.displayName, thirdCategory.displayName]
        
        for title in labelTitle {
            let label = createCustomLabel(withTitle: title)
            categoryLabelStack.addArrangedSubview(label)
        }
        
        
        let securePosterURL = posterPath.replacingOccurrences(of: "http://", with: "https://")
        
        if let url = URL(string: securePosterURL){
            titleImageView.sd_setImage(with: url)
        } else {
            titleImageView.image = UIImage(systemName: "house")
        }
        
        titleLabel.text = title
        addressLabel.text = address
    }
}
