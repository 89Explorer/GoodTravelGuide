//
//  HomeViewController.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/27/24.
//

import UIKit

protocol CategoryCollectionViewDelegate: AnyObject {
    func didSelected(at index: Int)
}

class HomeViewController: UIViewController {
    
    
    // MARK: - Variables
    private let categoryButtonTitle = ["Attractions", "Facilities", "Events", "Course"]
    private let categoryButtonImageName = ["attraction", "facilities", "event", "tour"]
    private var selectedIndex: Int = 0 // 선택된 버튼의 인덱스
    weak var delegate: CategoryCollectionViewDelegate?
    
    
    // MARK: - UI Components
    private let homeHeaderTitle: NavigationBarTitleView = {
        let titleView = NavigationBarTitleView()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        return titleView
    }()
    
    private let categoryCollectionView: CategoryCollectionView = {
        let categoryCollectionView = CategoryCollectionView()
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return categoryCollectionView
    }()
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeHeaderTitle.configureTitle(mainTitle: "Discover", subTitle: "New Places")
        
        view.backgroundColor = UIColor(named: "ivory")
        
        view.addSubview(homeHeaderTitle)
        view.addSubview(categoryCollectionView)
        
        collectionViewDelegate()
        configureConstraints()
    }
    
    
    
    // MARK: - Layouts
    private func configureConstraints() {
        let homeHeaderTitleConstraints = [
            homeHeaderTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            homeHeaderTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            homeHeaderTitle.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        let categoryCollectionViewConstraints = [
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            categoryCollectionView.topAnchor.constraint(equalTo: homeHeaderTitle.bottomAnchor, constant: 16),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(homeHeaderTitleConstraints)
        NSLayoutConstraint.activate(categoryCollectionViewConstraints)
    }
    
    
    // MARK: - Functions
    private func collectionViewDelegate() {
        categoryCollectionView.getcategoryCollectionView().delegate = self
        categoryCollectionView.getcategoryCollectionView().dataSource = self
        categoryCollectionView.getcategoryCollectionView().register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryButtonTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        
        let title = categoryButtonTitle[indexPath.row]
        let isSelected = indexPath.item == selectedIndex
        
        cell.configure(with: title, isSelected: isSelected)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        collectionView.reloadData() // 선택 상태 업데이트
        delegate?.didSelected(at: selectedIndex) // Delegate 호출
    }
}


extension HomeViewController: CategoryCollectionViewDelegate {
    func didSelected(at index: Int) {
        switch index {
        case 0:
            loadAttractionsData()
        case 1:
            loadFacilitiesData()
        case 2:
            loadEventsData()
        default:
            break
        }
    }
    
    private func loadAttractionsData() {
        // API 호출 및 데이터 처리
    }
    
    private func loadFacilitiesData() {
        // API 호출 및 데이터 처리
    }
    
    private func loadEventsData() {
        // API 호출 및 데이터 처리
    }
}
