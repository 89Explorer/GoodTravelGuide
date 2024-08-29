//
//  CategoryTableView.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/28/24.
//

import UIKit

class CategoryTableView: UIView {
    
    
    // MARK: - UI Components
//    private let basicView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .clear
//        view.layer.cornerRadius = 5
//        view.clipsToBounds = true
//        return view
//    }()
    
    private let homeDataTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)

        //addSubview(basicView)
        //basicView.addSubview(homeDataTableView)
        addSubview(homeDataTableView)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layouts
    private func configureConstraints() {
//        let basicViewConstraints = [
//            basicView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            basicView.topAnchor.constraint(equalTo: topAnchor),
//            basicView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ]
//        
//        let homeDataTableViewConstraints = [
//            homeDataTableView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 5),
//            homeDataTableView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -5),
//            homeDataTableView.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 5),
//            homeDataTableView.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: -5)
//        ]
        
        let homeDataTableViewConstraints = [
            homeDataTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeDataTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeDataTableView.topAnchor.constraint(equalTo: topAnchor),
            homeDataTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        //NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(homeDataTableViewConstraints)
    }
    
    
    // MARK: - Functions
    func getHomeDataTableView() -> UITableView {
        return homeDataTableView
    }
}
