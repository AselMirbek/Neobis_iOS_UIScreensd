

import UIKit
class CryptoViewController : UIViewController{
  private  let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Портфолио"
      label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    private let settingButton: UIButton = {
            let button = UIButton()
            let buttonImage = UIImage(named: "SettingCrypto")
            button.setImage(buttonImage, for: .normal)
            return button
        }()
    private let allSeeButton: UIButton = {
            let button = UIButton()
           let buttonLabel = UILabel()
        buttonLabel.textColor = .systemRed
        buttonLabel.textAlignment = .right
        buttonLabel.text = "посмотреть все"
        buttonLabel.font = .systemFont(ofSize: 14, weight: .regular)
        button.addSubview(buttonLabel)
        //set up  ui
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               buttonLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor),
               buttonLabel.trailingAnchor.constraint(equalTo: button.trailingAnchor),
               buttonLabel.topAnchor.constraint(equalTo: button.topAnchor),
               buttonLabel.bottomAnchor.constraint(equalTo: button.bottomAnchor)
           ])
           
            return button
        }()
  
    private let tableImageView: [UIImage] = [
        UIImage(named: "TableImage1")!,
        UIImage(named: "TableImage2")!,
        UIImage(named: "TableImage3")!,
        UIImage(named: "TableImage1")!,
        UIImage(named: "TableImage2")!,
        UIImage(named: "TableImage3")!,
        UIImage(named: "TableImage1")!,
        UIImage(named: "TableImage2")!,
        UIImage(named: "TableImage3")!
    ]
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
    }()
    private lazy var customTabBar: CryptoBottomTabBar = {
        let tabBar = CryptoBottomTabBar()
        return tabBar
    }()
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    private lazy var topNavigationBar: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 44)
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.9)
        return view
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setUp()
        self.setUpUITableView()
        addCustomTabBar()
        

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    private func addCustomTabBar() {
       
        addChild(customTabBar)
        view.addSubview(customTabBar.view)
        customTabBar.view.translatesAutoresizingMaskIntoConstraints = false
        
     
        NSLayoutConstraint.activate([
            customTabBar.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTabBar.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customTabBar.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customTabBar.view.heightAnchor.constraint(equalToConstant: 80)
        ])
        
      
        customTabBar.didMove(toParent: self)
    }
    private func setUp(){
        addBackgroundView()
        addTopNavigationBar()
        view.addSubview(backgroundView)
        
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(settingButton)
        backgroundView.addSubview(allSeeButton)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        allSeeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,constant: 15),
            titleLabel.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor, constant: 35),
            
            
            settingButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: -10),
            settingButton.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor, constant: 35),
            settingButton.widthAnchor.constraint(equalToConstant: 24),
            settingButton.heightAnchor.constraint(equalToConstant: 24),
            
            
            allSeeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: -10),
            allSeeButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            allSeeButton.topAnchor.constraint(equalTo: settingButton.bottomAnchor, constant: 30),
        ])

        
            }
    private func addBackgroundView() {
        let parent = self.view!
        parent.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: parent.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
    }
 
    private func setUpUITableView() {
        self.view.backgroundColor = .systemRed
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
      
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      
            tableView.topAnchor.constraint(equalTo: allSeeButton.bottomAnchor, constant: 10),

        ])
    }
  
    private func addTopNavigationBar() {
        self.view.addSubview(topNavigationBar)
        topNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topNavigationBar.topAnchor.constraint(equalTo: self.view.topAnchor),
            topNavigationBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topNavigationBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            topNavigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}
extension CryptoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableImageView.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else {
            fatalError("The TableView could not dequeue a SingleTableViewCell in SingleViewController.")
        }

        let image = self.tableImageView[indexPath.row]
                var title = ""
                var procentLabel = ""
        var  labelDollar = ""
        var namedDollar = ""
                switch indexPath.row {
                case 0:
                    title = "Bitcoin"
                    procentLabel = "+1,6%"
                    labelDollar = "$29,850.15"
                    namedDollar = "2.73 BTC"
                case 1:
                    title = "Ethereum"
                    procentLabel = "-0,82%"
                    labelDollar = "$10,561.24"
                    namedDollar = "47.61 ETH"
                case 2:
                    title = "Litecoin"
                    procentLabel = "+0,27%"
                    labelDollar = "$5,241.62"
                    namedDollar = " 39,27 LTC"
                case 3:
                    title = "Ripple"
                    procentLabel = "-2,10%"
                    labelDollar = "$3,676.76"
                    namedDollar = "165555,76XRP"
                case 4:
                    title = "Bitcoin"
                    procentLabel = "+1,6%"
                    labelDollar = "$29,850.15"
                    namedDollar = "2.73 BTC"
                case 5:
                    title = "Ethereum"
                    procentLabel = "-0,82%"
                    labelDollar = "$10,561.24"
                    namedDollar = "47.61 ETH"
                case 6:
                    title = "Litecoin"
                    procentLabel = "+0,27%"
                    labelDollar = "$5,241.62"
                    namedDollar = " 39,27 LTC"
                case 7:
                    title = "Bitcoin"
                    procentLabel = "+1,6%"
                    labelDollar = "$29,850.15"
                    namedDollar = "2.73 BTC"
                case 8:
                    title = "Ethereum"
                    procentLabel = "-0,82%"
                    labelDollar = "$10,561.24"
                    namedDollar = "47.61 ETH"
                case 9:
                    title = "Litecoin"
                    procentLabel = "+0,27%"
                    labelDollar = "$5,241.62"
                    namedDollar = " 39,27 LTC"
                
                default:
                    break
                }

            
        cell.configure(with: image, title: title,procentLabel: procentLabel, labelDollar: labelDollar,namedDollar:namedDollar)
                return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

