//
//  MainViewController.swift
//  CryptoConvector
//
//  Created by KODDER on 16.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    var coinView = CoinView()
    var coinManager = CoinManager()
    
    let currencyPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        
        coinManager.delegate = self
        currencyPickerView.dataSource = self
        currencyPickerView.delegate = self
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        view.addSubview(coinView)
        view.addSubview(currencyPickerView)
    }
}

//MARK: - CoinManagerDelegate
extension MainViewController: CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.coinView.numberLabel.text = price
            self.coinView.nameCurrency.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return coinManager.currencyArray.count
      }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return coinManager.currencyArray[row]
      }
      
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          let selectedCurrency = coinManager.currencyArray[row]
          coinManager.getCoinPrice(for: selectedCurrency)
      }
}


//MARK: - Constraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            coinView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            coinView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coinView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coinView.heightAnchor.constraint(equalToConstant: 100),
            
            currencyPickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            currencyPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currencyPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currencyPickerView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
