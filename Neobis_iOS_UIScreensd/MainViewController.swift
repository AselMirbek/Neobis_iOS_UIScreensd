//
//  ViewController.swift
//  Neobis_iOS_UIScreensd
//
//  Created by Interlink on 16/11/23.
//


import UIKit

class MainViewController: UIViewController {
   //5 кнопки с возвратом
    let  singleButton = UIButton()
    let  travelButton = UIButton()
    let  financeButton = UIButton()
    let  cryptoButton = UIButton()
    let weatherButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        //  view.backgroundColor = .systemMint
        title = "Main View Controller"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    //
    func setUpButton(){
        //single design and function
        view.addSubview( singleButton)
        singleButton.configuration = .filled()
        singleButton.configuration?.baseBackgroundColor = .systemPink
        singleButton.configuration?.title = "Single"
       //next screen
        singleButton.addTarget(self, action: #selector (nextButtonTappedSingle), for:.touchUpInside )
        singleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            singleButton.centerXAnchor.constraint(equalTo:view.centerXAnchor,constant: -103),
            singleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -183),
            singleButton.widthAnchor.constraint(equalToConstant: 200),
            singleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        //travel design and function
        view.addSubview(  travelButton)
        travelButton.configuration = .filled()
        travelButton.configuration?.baseBackgroundColor = .systemPink
        travelButton.configuration?.title = "Travel"
       //next screen
        travelButton.addTarget(self, action: #selector (nextButtonTappedTravel), for:.touchUpInside )
        travelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            travelButton.centerXAnchor.constraint(equalTo:view.centerXAnchor,constant: -103),
            travelButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -87),
            travelButton.widthAnchor.constraint(equalToConstant: 200),
            travelButton.heightAnchor.constraint(equalToConstant: 50)
        ])
     
        
        view.addSubview(  financeButton)
        financeButton.configuration = .filled()
        financeButton.configuration?.baseBackgroundColor = .systemPink
        financeButton.configuration?.title = "Finance"
       //next screen
        financeButton.addTarget(self, action: #selector (nextButtonTappedFinance), for:.touchUpInside )
        financeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            financeButton.centerXAnchor.constraint(equalTo:view.centerXAnchor,constant: -103),
            financeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 9),
            financeButton.widthAnchor.constraint(equalToConstant: 200),
            financeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        // crypto design and function
        view.addSubview(cryptoButton)
        cryptoButton.configuration = .filled()
        cryptoButton.configuration?.baseBackgroundColor = .systemPink
        cryptoButton.configuration?.title = "Crypto"
       //next screen
        cryptoButton.addTarget(self, action: #selector (nextButtonTappedCrypto), for:.touchUpInside )
        cryptoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cryptoButton.centerXAnchor.constraint(equalTo:view.centerXAnchor,constant: -103),
            cryptoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 105),
            cryptoButton.widthAnchor.constraint(equalToConstant: 200),
            cryptoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        // crypto design and function
        view.addSubview(weatherButton)
        weatherButton.configuration = .filled()
        weatherButton.configuration?.baseBackgroundColor = .systemPink
        weatherButton.configuration?.title = "Weather"
       //next screen
        weatherButton.addTarget(self, action: #selector (nextButtonTappedWeather), for:.touchUpInside )
        weatherButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherButton.centerXAnchor.constraint(equalTo:view.centerXAnchor,constant: -103),
            weatherButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 160),
            weatherButton.widthAnchor.constraint(equalToConstant: 200),
            weatherButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    //next screen Single
    @objc func nextButtonTappedSingle(){
        let nextScreen = SingleViewController()
     //   nextScreen.title = "Single View Controller"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
 @objc func nextButtonTappedTravel() {
        let nextScreenTravel = TravelViewController()
        navigationController?.pushViewController(nextScreenTravel, animated: true)
    }

    @objc func nextButtonTappedFinance(){
        let nextScreenFinance = FinanceViewController()
    navigationController?.pushViewController(nextScreenFinance, animated: true)
    }
    @objc func nextButtonTappedCrypto(){
        let nextScreenCrypto = CryptoViewController()
      //  nextScreen.title = "Single View Controller"
        navigationController?.pushViewController(nextScreenCrypto, animated: true)
    }
    @objc func nextButtonTappedWeather(){
        let nextScreenCrypto = WeatherViewController()
        navigationController?.pushViewController(nextScreenCrypto, animated: true)
    }
}


