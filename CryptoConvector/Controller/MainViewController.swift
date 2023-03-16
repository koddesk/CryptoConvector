//
//  MainViewController.swift
//  CryptoConvector
//
//  Created by KODDER on 16.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    let coinView = CoinView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        view.addSubview(coinView)
    }
}

//MARK: - Constraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            coinView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            coinView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coinView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coinView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
