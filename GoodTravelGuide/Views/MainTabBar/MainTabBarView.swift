//
//  MainTabBarView.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/27/24.
//

import UIKit

class MainTabBarView: UIView {
    

    // MARK: - Variables
    // 현재 선택된 버튼
    private var selectedButton: UIButton?
    
    // 버튼이 눌렸을 때 호출될 클로저 (화면 전환에 사용)
    var buttonTapped: ((Int) -> Void)?
    
    
    // MARK: - UI Components
    // 버튼을 담고 있는 stackView
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.backgroundColor = UIColor(named: "darkest-orange")
        return stackView
    }()
    
    // stackView에 담을 버튼들
    private lazy var homeButton = createButton(imageName: "house.fill", tag: 0)
    private lazy var searchButton = createButton(imageName: "magnifyingglass", tag: 1)
    private lazy var profileButton = createButton(imageName: "person.fill", tag: 2)
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        stackView.addArrangedSubview(homeButton)
        stackView.addArrangedSubview(searchButton)
        stackView.addArrangedSubview(profileButton)
        
        // 초기 상태에서 homeButton을 선택된 상태로 설정
        selectButton(homeButton)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        let stackViewConstraints = [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(stackViewConstraints)
    }
    
    // MARK: - Functions
    
    /// 이미지 이름과 태그를 받아서 버튼을 생성하는 함수
    /// - Parameters:
    ///   - imageName: 시스템 아이콘 이미지 이름
    ///   - tag: 버튼에 할당될 태그 (버튼의 인덱스)
    /// - Returns: 생성된 UIButton 객체
    private func createButton(imageName: String, tag: Int) -> UIButton {
        let button = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .bold, scale: .medium)
        let image = UIImage(systemName: imageName, withConfiguration: largeConfig)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        button.tintColor = .white  // 초기 상태에서는 버튼의 색상을 흰색으로 설정
        button.tag = tag
        return button
    }
    
    
    /// 버튼이 눌렸을 때 호출되는 함수
    /// - Parameter sender: 눌린 버튼 객체
    @objc private func buttonDidTapped(_ sender: UIButton) {
        selectButton(sender)  // 눌린 버튼을 선택 상태로 설정
        buttonTapped?(sender.tag)  // 버튼의 태그(인덱스)를 클로저로 전달
    }
    
    /// 버튼의 선택 상태를 업데이트하는 함수
    /// - Parameter button: 선택된 버튼
    private func selectButton(_ button: UIButton) {
        // 모든 버튼의 색상을 흰색으로 초기화
        [homeButton, searchButton, profileButton].forEach { $0.tintColor = .white }
        
        // 선택된 버튼의 색상을 검은색으로 설정
        button.tintColor = .newOrange
        selectedButton = button  // 현재 선택된 버튼을 업데이트
    }
}

