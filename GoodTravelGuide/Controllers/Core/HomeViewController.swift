//
//  HomeViewController.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/27/24.
//

import UIKit


class HomeViewController: UIViewController {
    
    
    // MARK: - Variables
    private let categoryButtonTitle = ["Attractions", "Facilities", "Events", "Course", "Leisure activity"]
    
    private let categoryButtonImageName = ["attraction", "facilities", "event", "tour"]
    
    private var selectedIndex: Int = 0 // 선택된 버튼의 인덱스
    
    
    
    
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
    
    private let titleImageView: TitleImageView = {
        let imageView = TitleImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let hotplaceTitle: NavigationBarTitleView = {
        let titleView = NavigationBarTitleView()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        return titleView
    }()
    
    
    private let categoryTableView: CategoryTableView = {
        let tableView = CategoryTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeHeaderTitle.configureTitle(mainTitle: "Discover", subTitle: "new places")
        
        hotplaceTitle.configureTitle(mainTitle: "Hot places 🔥", subTitle: "")
        
        view.backgroundColor = UIColor(named: "ivory")
        
        view.addSubview(homeHeaderTitle)
        view.addSubview(categoryCollectionView)
        // view.addSubview(categoryTableView)
        view.addSubview(titleImageView)
        view.addSubview(hotplaceTitle)
        
        collectionViewDelegate()
        tableViewDelegate()
        
        configureConstraints()
    }
    
    
    
    // MARK: - Layouts
    private func configureConstraints() {
        let homeHeaderTitleConstraints = [
            homeHeaderTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            homeHeaderTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            homeHeaderTitle.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        let categoryCollectionViewConstraints = [
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            categoryCollectionView.topAnchor.constraint(equalTo: homeHeaderTitle.bottomAnchor, constant: 10),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let titleImageViewConstraints = [
            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleImageView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 10),
            titleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleImageView.heightAnchor.constraint(equalToConstant: 350)
        ]
        
        let hotplaceTitleConstraints = [
            hotplaceTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            hotplaceTitle.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 25),
            hotplaceTitle.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        //        let categoryTableViewConstraints = [
        //            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        //            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        //            categoryTableView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 3),
        //            categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90)
        //        ]
        
        NSLayoutConstraint.activate(homeHeaderTitleConstraints)
        NSLayoutConstraint.activate(categoryCollectionViewConstraints)
        NSLayoutConstraint.activate(titleImageViewConstraints)
        NSLayoutConstraint.activate(hotplaceTitleConstraints)
        // NSLayoutConstraint.activate(categoryTableViewConstraints)
    }
    
    
    // MARK: - Functions
    private func collectionViewDelegate() {
        categoryCollectionView.getcategoryCollectionView().delegate = self
        categoryCollectionView.getcategoryCollectionView().dataSource = self
        categoryCollectionView.getcategoryCollectionView().register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    private func tableViewDelegate() {
        categoryTableView.getHomeDataTableView().delegate = self
        categoryTableView.getHomeDataTableView().dataSource = self
        categoryTableView.getHomeDataTableView().register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
    }
    
    
    private func loadAttractionsData() {
        print("Attractions data loaded")
    }
    
    private func loadFacilitiesData() {
        print("Facilities data loaded")
    }
    
    private func loadEventsData() {
        print("Events data loaded")
    }
    
    private func loadCourseData() {
        print("Course data loaded")
    }
    
    private func loadLeisureactivityData() {
        print("Leisure activity data loaded")
    }
}


// MARK: - extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryButtonTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        
        let title = categoryButtonTitle[indexPath.row]
        let isSelected = indexPath.item == selectedIndex
        // cell.delegate = self
        
        cell.configure(with: title, isSelected: isSelected, index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.item
        collectionView.reloadData() // 선택 상태 업데이트
        // didSelected(at: selectedIndex) // Delegate 호출
        switch selectedIndex {
        case 0:
            loadAttractionsData()
        case 1:
            loadFacilitiesData()
        case 2:
            loadEventsData()
        case 3:
            loadCourseData()
        case 4:
            loadLeisureactivityData()
        default:
            break
        }
    }
}



extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath)
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
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
        case 3:
            loadCourseData()
        case 4:
            loadLeisureactivityData()
        default:
            break
        }
    }
}
