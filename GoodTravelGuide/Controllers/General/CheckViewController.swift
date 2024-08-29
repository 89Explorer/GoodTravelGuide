//
//  CheckViewController.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/29/24.
//

import UIKit

class CheckViewController: UIViewController {
    
    private let titleImageView: TitleImageView = {
        let imageView = TitleImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = .systemRed
        view.addSubview(titleImageView)
        configureConstraints()
        
    }
    
    private func configureConstraints() {
        
        let titleImageViewConstraints = [
            titleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleImageView.heightAnchor.constraint(equalToConstant: 450),
            titleImageView.widthAnchor.constraint(equalToConstant: 400)
        ]
        
        NSLayoutConstraint.activate(titleImageViewConstraints)
    }
}
