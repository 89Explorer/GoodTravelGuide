//
//  NavigationBarTitle.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/27/24.
//

import UIKit

class NavigationBarTitleView: UIView {
    
    // MARK: - UI Components
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .heavy)
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    private let titleUnderLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleStackView)
        addSubview(titleUnderLine)
        titleStackView.addArrangedSubview(mainTitleLabel)
        titleStackView.addArrangedSubview(subTitleLabel)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layouts
    private func configureConstraints() {
        let titleStackViewConstraints = [
            titleStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleStackView.topAnchor.constraint(equalTo: topAnchor),
            titleStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let titleUnderLineConstraints = [
            titleUnderLine.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 4),
            titleUnderLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleUnderLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleUnderLine.heightAnchor.constraint(equalToConstant: 3)
        ]
        
        NSLayoutConstraint.activate(titleStackViewConstraints)
        NSLayoutConstraint.activate(titleUnderLineConstraints)
    }
    
    
    // MARK: - Functions
    func configureTitle(mainTitle: String, subTitle: String) {
        mainTitleLabel.text = mainTitle
        subTitleLabel.text = subTitle
    }
}
