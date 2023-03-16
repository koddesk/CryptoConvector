//
//  CoinView.swift
//  CryptoConvector
//
//  Created by KODDER on 16.03.2023.
//

import UIKit

class CoinView: UIView {
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Convector"
        label.font = .systemFont(ofSize: 50, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let convectorView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant: 350).isActive = true
        view.backgroundColor = UIColor(named: "CoinViewColor")
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var headerStackView = UIStackView()
    
    private let bitcoinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.image = UIImage(systemName: "bitcoinsign.circle.fill")?.withRenderingMode(.automatic)
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameCurrency: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var internalStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        headerStackView = UIStackView(arrangedSubviews: [mainLabel, convectorView],
                                      axis: .vertical,
                                      spacing: 25,
                                      alignment: .center)
        addSubview(headerStackView)
        
        internalStackView = UIStackView(arrangedSubviews: [bitcoinImageView,
                                                           numberLabel,
                                                           nameCurrency],
                                        axis: .horizontal,
                                        spacing: 10,
                                        alignment: .center)
        convectorView.addSubview(internalStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Constraints
extension CoinView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor),
            
            internalStackView.topAnchor.constraint(equalTo: convectorView.topAnchor),
            internalStackView.leadingAnchor.constraint(equalTo: convectorView.leadingAnchor),
            internalStackView.trailingAnchor.constraint(equalTo: convectorView.trailingAnchor, constant: -10),
            internalStackView.bottomAnchor.constraint(equalTo: convectorView.bottomAnchor)
        
        ])
    }
}







