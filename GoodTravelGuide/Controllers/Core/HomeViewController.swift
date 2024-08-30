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
    private let basicScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
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
    
    private let hotplacesCollectionView: HotPlacesCollectionView = {
        let collectionView = HotPlacesCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
        
        view.addSubview(basicScrollView)
        basicScrollView.addSubview(contentView)
        
        contentView.addSubview(homeHeaderTitle)
        contentView.addSubview(categoryCollectionView)

        contentView.addSubview(titleImageView)
        contentView.addSubview(hotplaceTitle)
        contentView.addSubview(hotplacesCollectionView)
        
        collectionViewDelegate()
        tableViewDelegate()
        hotPlacesCollectionViewDelegate()
        
        configureConstraints()
    }
    
    
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        let basicScrollViewConstraints = [
            basicScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            basicScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            basicScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            basicScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let contentViewConstraints = [
            contentView.leadingAnchor.constraint(equalTo: basicScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: basicScrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: basicScrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: basicScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: basicScrollView.widthAnchor)
        ]
        
        let homeHeaderTitleConstraints = [
            homeHeaderTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            homeHeaderTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            homeHeaderTitle.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        let categoryCollectionViewConstraints = [
            categoryCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            categoryCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            categoryCollectionView.topAnchor.constraint(equalTo: homeHeaderTitle.bottomAnchor, constant: 10),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let titleImageViewConstraints = [
            titleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleImageView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 10),
            titleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleImageView.heightAnchor.constraint(equalToConstant: 350)
        ]
        
        let hotplaceTitleConstraints = [
            hotplaceTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hotplaceTitle.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 25),
            hotplaceTitle.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let hotplacesCollectionViewConstraints = [
            hotplacesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hotplacesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            hotplacesCollectionView.topAnchor.constraint(equalTo: hotplaceTitle.bottomAnchor, constant: 16),
            hotplacesCollectionView.heightAnchor.constraint(equalToConstant: 420),
            
            hotplacesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60)
        ]
        
        
        NSLayoutConstraint.activate(basicScrollViewConstraints)
        NSLayoutConstraint.activate(contentViewConstraints)
        NSLayoutConstraint.activate(homeHeaderTitleConstraints)
        NSLayoutConstraint.activate(categoryCollectionViewConstraints)
        NSLayoutConstraint.activate(titleImageViewConstraints)
        NSLayoutConstraint.activate(hotplaceTitleConstraints)
        NSLayoutConstraint.activate(hotplacesCollectionViewConstraints)
        
         // UIScrollView의 contentSize 설정
//        DispatchQueue.main.async {
//            let contentHeight = 70 + 40 + 350 + 30 + 240 + 96  // 각 뷰들의 height 합산 + 간격(약간의 여유 포함)
//            self.basicScrollView.contentSize = CGSize(width: self.view.bounds.width, height: CGFloat(contentHeight))
//        }
        
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
    
    private func hotPlacesCollectionViewDelegate() {
        hotplacesCollectionView.getHotPlacesCollectionView().delegate = self
        hotplacesCollectionView.getHotPlacesCollectionView().dataSource = self
        hotplacesCollectionView.getHotPlacesCollectionView().register(HotPlacesCollectionViewCell.self, forCellWithReuseIdentifier: HotPlacesCollectionViewCell.identifier)
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
        
        if collectionView == categoryCollectionView.getcategoryCollectionView() {
            return categoryButtonTitle.count
        } else if collectionView == hotplacesCollectionView.getHotPlacesCollectionView() {
            return 4
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView.getcategoryCollectionView() {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            
            let title = categoryButtonTitle[indexPath.row]
            let isSelected = indexPath.item == selectedIndex
            // cell.delegate = self
            
            cell.configure(with: title, isSelected: isSelected, index: indexPath.item)
            return cell
        } else if collectionView == hotplacesCollectionView.getHotPlacesCollectionView() {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotPlacesCollectionViewCell.identifier, for: indexPath) as? HotPlacesCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == categoryCollectionView.getcategoryCollectionView() {
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
        } else if collectionView == hotplacesCollectionView.getHotPlacesCollectionView() {
            // HotPlaces 컬렉션 뷰 아이템 선택 시 처리
            print("Selected hot place at index \(indexPath.item)")
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
