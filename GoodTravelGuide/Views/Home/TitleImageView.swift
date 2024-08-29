//
//  TitleImageView.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/29/24.
//

import UIKit

class TitleImageView: UIView {
    
    let buttonTitle: [String] = ["인문", "역사관광지", "유적지/사적지"]
    
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
        imageView.contentMode = .scaleAspectFill
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
    
    private let categoryButtonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var buttons: [UIButton] = {
        return buttonTitle.map { title in
            let button = createCustomButton(withTitle: title)
            return button
        }
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
        
        addSubview(categoryButtonStack)
        for button in buttons {
            categoryButtonStack.addArrangedSubview(button)
        }
        
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
            titleImageView.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 20),
            titleImageView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 20),
            titleImageView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -20),
            titleImageView.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        let titleStackViewConstraints = [
            titleStackView.leadingAnchor.constraint(equalTo: titleImageView.leadingAnchor),
            titleStackView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 10),
            titleStackView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let categoryButtonStackConstraints = [
            categoryButtonStack.leadingAnchor.constraint(equalTo: titleImageView.leadingAnchor),
            categoryButtonStack.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 15),
            categoryButtonStack.heightAnchor.constraint(equalToConstant: 30),
        ]
        
        let bookMarkButtonConstraints = [
            bookMarkButton.trailingAnchor.constraint(equalTo: titleImageView.trailingAnchor, constant: -10),
            bookMarkButton.bottomAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(titleImageViewConstraints)
        NSLayoutConstraint.activate(titleStackViewConstraints)
        NSLayoutConstraint.activate(categoryButtonStackConstraints)
        NSLayoutConstraint.activate(bookMarkButtonConstraints)
    }
    
    
    // MARK: - Functions
//    func createCustomButton(withTitle title: String) -> UIButton {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle(title, for: .normal)
//        button.backgroundColor = .darkOrange
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 4
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//        button.titleEdgeInsets
//        return button
//    }
    
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
}
