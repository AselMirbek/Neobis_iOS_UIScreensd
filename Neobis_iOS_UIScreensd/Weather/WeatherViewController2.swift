

import UIKit

class WeatherViewController2 : UIViewController{
    private lazy var backgroundUImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1WeatherBackground"))
        return imageView
    }()

    private  let todayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Сегодня"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.text = "Апр, 26"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        return label
    }()
    private  let weekLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.text = "На этой неделе"
        label.font = UIFont.systemFont(ofSize: 24, weight: .black)
        return label
    }()
    private lazy var calendarImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "2WeatherCalendar"))
        return imageView
    }()
    private lazy var settingImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "2WeatherSetting"))
        return imageView
    }()
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "2WeatherIcon"))
        return imageView
    }()

    private lazy var sunLogoImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "2WeatherIconSun"))
        return imageView
    }()

    

    private let tableImageView: [UIImage] = [
        UIImage(named: "2WeatherStorm")!,
        UIImage(named: "2WeatherCloudytwo")!,
        UIImage(named: "2WeatherSunly")!,
        UIImage(named: "2WeatherRain")!,
        UIImage(named: "2WeatherGood")!,
        UIImage(named: "2WeatherRain")!,
        UIImage(named: "2WeatherStorm")!
    ]
    private let collectionImageView: [UIImage] = [
    UIImage(named: "2WeatherGood")!,
        UIImage(named: "2WeatherGood")!,
        UIImage(named: "2WeatherCloudytwo")!,
        UIImage(named: "2WeatherCloudyEvening")!,
        UIImage(named: "2WeatherCloudyEvening")!
    ]
    private let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal

            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .clear
            collectionView.register( WeatherCollectionViewCell.self, forCellWithReuseIdentifier:  WeatherCollectionViewCell.identifier)
            return collectionView
        }()
   
    private lazy var slider: UISlider = {
        let slider = UISlider()
           slider.translatesAutoresizingMaskIntoConstraints = false
           slider.minimumValue = 0
           slider.maximumValue = 1
           slider.value = 0.5
           slider.tintColor = .clear
           slider.thumbTintColor = .clear

          
           slider.frame = CGRect(x: 378, y: 488, width: 6, height: 294)

          
           slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)

        
           slider.layer.backgroundColor = UIColor.clear.cgColor
           slider.layer.cornerRadius = 5
           slider.layer.borderWidth = 1
           slider.layer.borderColor = UIColor(white: 1, alpha: 0.5).cgColor

           // Apply drop shadow
           slider.layer.shadowColor = UIColor.black.cgColor
           slider.layer.shadowOffset = CGSize(width: 0, height: 4)
           slider.layer.shadowOpacity = 0.25

          
        return slider
        }()
    // tableeView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        return tableView
    }()
    private lazy var backgroundView: UIView = {
        let view = UIView()
           
           // Set the gradient layer
           let gradientLayer = CAGradientLayer()
           gradientLayer.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
           gradientLayer.colors = [UIColor(red: 71/255.0, green: 191/255.0, blue: 223/255.0, alpha: 1.0).cgColor, UIColor(red: 74/255.0, green: 145/255.0, blue: 255/255.0, alpha: 1.0).cgColor]
           gradientLayer.locations = [0, 1]
           
        
           view.layer.cornerRadius = 15
      
           view.layer.insertSublayer(gradientLayer, at: 0)
           
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
        setUI()
        self.setUpUITableView()
        self.setUICollectionView()
             self.tableView.delegate = self
            self.tableView.dataSource = self
        tableView.separatorStyle = .none
                tableView.backgroundColor = .clear
        self.collectionView.delegate = self
       self.collectionView.dataSource = self
        
        
    }
    private func setUI(){
        addBackgroundView()
        backgroundView.addSubview(backgroundUImage)
        addTopNavigationBar()
        view.addSubview(slider)
        backgroundUImage.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            backgroundUImage.leadingAnchor.constraint(equalTo:  backgroundView.leadingAnchor,constant:89),
            backgroundUImage.topAnchor.constraint(equalTo:
                                                            view.safeAreaLayoutGuide.topAnchor, constant: -160),
            backgroundUImage.heightAnchor.constraint(equalToConstant:366.5),
            backgroundUImage.widthAnchor.constraint(equalToConstant:425),
            ])
            
            
                // Add constraints for the slider
                NSLayoutConstraint.activate([
                    slider.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor, constant: 400),
                    slider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 378),
                    slider.widthAnchor.constraint(equalToConstant: 6),
                    slider.heightAnchor.constraint(equalToConstant: 138)
                ])
        backgroundView.addSubview(settingImage)
        backgroundView.addSubview(todayLabel)
        backgroundView.addSubview(dateLabel)
        settingImage.translatesAutoresizingMaskIntoConstraints = false
       todayLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingImage.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor,constant: 20),
            settingImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: -15),
            settingImage.heightAnchor.constraint(equalToConstant: 24),
            settingImage.widthAnchor.constraint(equalToConstant: 24),
            
           dateLabel.topAnchor.constraint(equalTo: settingImage.bottomAnchor,constant: 35),
            dateLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: -15),
            
            
            
            todayLabel.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor,constant: 70),
            todayLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,constant: 25),
            ])
        backgroundView.addSubview(calendarImage)
        backgroundView.addSubview(weekLabel)
        calendarImage.translatesAutoresizingMaskIntoConstraints = false
        weekLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendarImage.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor,constant: 350),
           calendarImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: -15),
            calendarImage.heightAnchor.constraint(equalToConstant: 24),
            calendarImage.widthAnchor.constraint(equalToConstant: 24),
            
            weekLabel.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor,constant: 350),
            weekLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,constant: 25),

])
        backgroundView.addSubview(logoImage)
        backgroundView.addSubview(sunLogoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        sunLogoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor,constant: 745),
           logoImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: -120),
            logoImage.heightAnchor.constraint(equalToConstant: 25),
            logoImage.widthAnchor.constraint(equalToConstant: 110),
            
            sunLogoImage.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor,constant: 745),
            sunLogoImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,constant: 120),
            sunLogoImage.heightAnchor.constraint(equalToConstant: 24),
            sunLogoImage.widthAnchor.constraint(equalToConstant: 24),
            
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
            topNavigationBar.heightAnchor.constraint(equalToConstant: 50)
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
            tableView.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor,constant: 400),
              tableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,constant: 5),
              tableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: -50),
              
              tableView.heightAnchor.constraint(equalToConstant: 312)
          ])
      }
    private func setUICollectionView() {
          self.view.backgroundColor = .systemRed
          self.view.addSubview(collectionView)
          
        collectionView.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor,constant: 130),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
              
            collectionView.heightAnchor.constraint(equalToConstant: 200)
          ])
      }
    @objc func sliderValueChanged(_ sender: UISlider) {
           let offset = CGFloat(sender.value) * (tableView.contentSize.height - tableView.frame.height)
           tableView.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
       }
}
extension  WeatherViewController2: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableImageView.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as?  WeatherTableViewCell else {
            fatalError("The TableView could not dequeue a WeatherTableViewCell in WeatherViewController2.")
        }

        let image = self.tableImageView[indexPath.row]
                var date = ""
                var gradus = ""
                switch indexPath.row {
                case 0:
                    date = "Apr,27"
                    gradus = "21"
                   
                case 1:
                    date = "Apr,28"
                    gradus = "22"
                
                case 2:
                    date = "Apr,29"
                    gradus = "34"
                  

                case 3:
                    date = "Apr,30"
                    gradus = "27"

                case 4:
                    date = "May,1"
                    gradus = "32"
        
                case 5:
                    date = "May,1"
                    gradus = "32"
                case 6:
                    date = "May,1"
                    gradus = "32"
        
                default:
                    break
                }

        cell.configure(with: image, date: date, gradus: "\(gradus)°")
                return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
}
extension WeatherViewController2: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionImageView.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  WeatherCollectionViewCell.identifier, for: indexPath) as?  WeatherCollectionViewCell else {
            fatalError("The TableView could not dequeue a WeatherTableViewCell in WeatherViewController2.")}
        let image = self.tableImageView[indexPath.row]
        var time = ""
        var gradus = ""
        switch indexPath.row {
        case 0:
            time = "15.00"
            gradus = "21"
            
        case 1:
            time = "16.00"
            gradus = "29"
            
        case 2:
            time = "17.00"
            gradus = "26"
            
            
        case 3:
            time = "18.00"
            gradus = "22"
            
        case 4:
            time = "19.00"
            gradus = "20"
        case 5:
            time = "20.00"
            gradus = "18"
            
        case 6:
            time = "21.00"
            gradus = "18"
            
            
        default:
            break
        }
        cell.configure(with: image, time: time, gradus: "\(gradus)°C")
        return cell
    }
}

extension  WeatherViewController2: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 155)
    }
}

