

import UIKit

class FinanceViewController : UIViewController{

    private let currentDateLabel: UILabel = {
          let label = UILabel()
          label.textAlignment = .center
          label.font = .systemFont(ofSize: 16, weight: .medium)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()

      private let dateFormatter: DateFormatter = {
          let formatter = DateFormatter()
          formatter.dateFormat = "dd MMMM yyyy"
          return formatter
      }()

      private var currentDateIndex: Int = 0 {
          didSet {
              updateDate()
          }
      }
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        let buttonImage = UIImage(named: "FinanceCollectionImage1")?.withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    private let forwardButton: UIButton = {
        let button = UIButton(type: .system)
        let buttonImage = UIImage(named: "FinanceCollectionImage2")?.withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(forwardButtonTapped), for: .touchUpInside)
        return button
    }()

    private  let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Баланс"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    private  let balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "$1200.89"
        label.font = .systemFont(ofSize: 36, weight: .medium)
        return label
    }()
    
    
    private let tableImageView: [UIImage] = [
        UIImage(named: "FinanceTablelImage1")!,
        UIImage(named: "FinanceTablelImage2")!,
        UIImage(named: "FinanceTablelImage3")!,
        UIImage(named: "FinanceTablelImage4")!,
        UIImage(named: "FinanceTablelImage5")!,
        UIImage(named: "FinanceTablelImage1")!,
        UIImage(named: "FinanceTablelImage2")!
    ]
    
    // tableeView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(FinanceTableViewCell.self, forCellReuseIdentifier: FinanceTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var customTabBar: FinanceTabBar = {
        let tabBar = FinanceTabBar()
        return tabBar
    }()
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0xFA/255.0, green: 0xFA/255.0, blue: 0xFA/255.0, alpha: 255.0)
        return view
    }()
    
    private lazy var topNavigationBar: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 44)
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.9)
        return view
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        addCustomTabBar()
       
   self.setUpUITableView()
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
            customTabBar.view.heightAnchor.constraint(equalToConstant: 90)
        ])
        
     
        customTabBar.didMove(toParent: self)
    }
    private func setupUI() {
        addBackgroundView()
        addTopNavigationBar()
      
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(balanceLabel)
        backgroundView.addSubview(backButton)
        backgroundView.addSubview(forwardButton)
        view.addSubview(currentDateLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints =  false
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor, constant:40),
            balanceLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            balanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant:5),
            backButton.leadingAnchor.constraint(equalTo:  backgroundView.leadingAnchor, constant: 55),
               backButton.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor, constant: 130),
            backButton.widthAnchor.constraint(equalToConstant: 18),
            backButton.heightAnchor.constraint(equalToConstant: 18),

            forwardButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -50),
            forwardButton.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor, constant: 130),
            forwardButton.widthAnchor.constraint(equalToConstant: 20),
            forwardButton.heightAnchor.constraint(equalToConstant: 20),

            currentDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                       //currentDateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            currentDateLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor,constant: 25),
            
      ])
        updateDate()
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
            tableView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor,constant: 100),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            tableView.heightAnchor.constraint(equalToConstant: 420)
        ])
    }
    private func addTopNavigationBar() {
        
        view.addSubview(topNavigationBar)
        
        // Use safeAreaLayoutGuide to adjust the topNavigationBar
        _ = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            topNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topNavigationBar.topAnchor.constraint(equalTo: view.topAnchor),
            topNavigationBar.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    private func updateDate() {
        let currentDate = Calendar.current.date(byAdding: .day, value: currentDateIndex, to: Date()) ?? Date()
              let dateString = dateFormatter.string(from: currentDate)
              currentDateLabel.text = dateString
         }

         // MARK: - Button Actions

         @objc private func backButtonTapped() {
            currentDateIndex -= 1
            updateDate()
         
         }

    @objc private func forwardButtonTapped() {
        currentDateIndex += 1
        updateDate()}
    
}

   

 extension FinanceViewController: UITableViewDataSource, UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.tableImageView.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: FinanceTableViewCell.identifier, for: indexPath) as? FinanceTableViewCell else {
             fatalError("The TableView could not dequeue a FinanceTableViewCell in FinanceViewController.")
         }

         let image = self.tableImageView[indexPath.row]
                 var title = ""
                 var description = ""
                var money = ""
                 switch indexPath.row {
                 case 0:
                     title = "Дом"
                     description = "Продукты"
                     money = "$589"
                 case 1:
                     title = "Покупки"
                     description = "Одежда"
                     money = "$321"
                 case 2:
                     title = "Транспорт"
                     description = "Такси"
                     money = "$574"

                 case 3:
                     title = "Здоровье"
                     description = "Лечение"
                     money = "$124"
                 case 4:
                     title = "Фитнес"
                     description = "Тренировки"
                     money = "$765"
                 case 5:
                     title = "Счета"
                     description = "Комунальные"
                     money = "$324"

                 case 6:
                     title = "Ресторан"
                     description = "Ужин"
                     money = "$726"

                 default:
                     break
                 }

         cell.configure(with: image, title: title, description: description,money: money)
                 return cell
     }


     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 63
     }
 }
