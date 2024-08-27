//
//  MainTabBarViewController.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/27/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    // MARK: UI Components
    private let mainTabBar: MainTabBarView = {
        let tabBar = MainTabBarView()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isHidden = true
        
        view.addSubview(mainTabBar)
        
        // 뷰 컨트롤러 설정
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let profileVC = ProfileViewController()
        viewControllers = [homeVC, searchVC, profileVC]
        
        
        // 버튼이 눌렸을 때 호출될 클로저 설정
        mainTabBar.buttonTapped = { [weak self] index in
            self?.selectedIndex = index
        }
        
        configureConstraints()
    }
    
    
    // MARK: Layouts
    func configureConstraints() {
        let mainTabBarConstraints = [
            mainTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            mainTabBar.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(mainTabBarConstraints)
    }
}

