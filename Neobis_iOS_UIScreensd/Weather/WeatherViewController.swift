
import UIKit

class WeatherViewController: UIViewController {
    private lazy var backgroundView: UIView = {
        let view = UIView()
        
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
            gradientLayer.colors = [
                UIColor(red: 71/255.0, green: 191/255.0, blue: 223/255.0, alpha: 1.0).cgColor,
                UIColor(red: 74/255.0, green: 153/255.0, blue: 249/255.0, alpha: 0.8278).cgColor,
                UIColor(red: 74/255.0, green: 149/255.0, blue: 252/255.0, alpha: 0.921).cgColor,
                UIColor(red: 74/255.0, green: 146/255.0, blue: 254/255.0, alpha: 0.9763).cgColor,
                UIColor(red: 74/255.0, green: 145/255.0, blue: 255/255.0, alpha: 1.0).cgColor
            ]
            gradientLayer.locations = [0, 0.8278, 0.921, 0.9763, 1.0]
            
           
            view.layer.insertSublayer(gradientLayer, at: 0)
            
          
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 4)
            view.layer.shadowOpacity = 0.25
            
            // Set the corner radius
            view.layer.cornerRadius = 15
            
            return view
    }()
private lazy var backgroundUImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1WeatherBackground"))
        return imageView
    }()
   
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1WeatherSunGradient"))
        return imageView
    }()
    private lazy var foregroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1WeatherSun"))
        return imageView
    }()
    private lazy var imageWeather: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1WeatherMain"))
        return imageView
    }()

    private  let townLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Бишкек"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    private lazy var notificationImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1WeatherNotification"))
        return imageView
    }()
    private lazy var mapImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1WeatherMap"))
        return imageView
    }()
    private lazy var strokaImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1WeatherTopnavigation"))
        return imageView
    }()

    private lazy var topNavigationBar: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 44)
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.9)
        return view
    }() 
    private lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
           
            scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 1000)
            scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            scrollView.showsVerticalScrollIndicator = true
            return scrollView
        }()
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .custom)
            
               button.backgroundColor = .white
               button.layer.cornerRadius = 20
               button.layer.shadowColor = UIColor.black.cgColor
               button.layer.shadowOffset = CGSize(width: -4, height: 8)
               button.layer.shadowRadius = 50
               button.layer.shadowOpacity = 0.1
               button.layer.masksToBounds = false

            
        button.titleLabel?.shadowOffset = CGSize(width: 2, height: -3)
               button.titleLabel?.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)

        button.setTitle("Прогноз на неделю", for: .normal)
               button.setTitleColor(.black, for: .normal)
               button.titleLabel?.font = UIFont(name: "Overpass-Regular", size: 16)

   

        let buttonImage = UIImage(named: "1WeatherButton")
        button.setImage(buttonImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 215, bottom: 0, right: 10)
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 60)

        button.addTarget(self, action: #selector(scrollToTopAndNavigate), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
       
    }

    private func setUI() {
        addBackgroundView()
        addTopNavigationBar()
        backgroundView.addSubview(backgroundUImage)
        backgroundView.addSubview(backgroundImage)
        backgroundView.addSubview(foregroundImage)
        backgroundView.addSubview(imageWeather)
        backgroundView.addSubview(notificationImage)
        backgroundView.addSubview(strokaImage)
        backgroundView.addSubview(mapImage)
        backgroundView.addSubview(townLabel)
  
       view.addSubview(scrollView)
        scrollView.addSubview(actionButton)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                   scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               ])
       backgroundUImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        foregroundImage.translatesAutoresizingMaskIntoConstraints = false
        imageWeather.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        notificationImage.translatesAutoresizingMaskIntoConstraints = false
        strokaImage.translatesAutoresizingMaskIntoConstraints = false
        mapImage.translatesAutoresizingMaskIntoConstraints = false
        townLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundUImage.leadingAnchor.constraint(equalTo:  backgroundView.leadingAnchor,constant:79),
            backgroundUImage.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: -40),

            backgroundUImage.heightAnchor.constraint(equalToConstant:366.5),
            backgroundUImage.widthAnchor.constraint(equalToConstant:425),
            
            
            backgroundImage.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            backgroundImage.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 70),

                      backgroundImage.heightAnchor.constraint(equalToConstant:230),
            backgroundImage.widthAnchor.constraint(equalToConstant:230),
                      foregroundImage.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                      foregroundImage.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 140),
            foregroundImage.heightAnchor.constraint(equalToConstant: 94),
            foregroundImage.widthAnchor.constraint(equalToConstant: 94),
                      imageWeather.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                      imageWeather.topAnchor.constraint(equalTo:    backgroundView.topAnchor, constant: 320),
                      imageWeather.heightAnchor.constraint(equalToConstant: 335),
                      imageWeather.widthAnchor.constraint(equalToConstant: 353),
            notificationImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15),
               notificationImage.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor, constant: 39),
               notificationImage.widthAnchor.constraint(equalToConstant: 26),
               notificationImage.heightAnchor.constraint(equalToConstant: 24),
               
               mapImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
               mapImage.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor, constant: 29),
               mapImage.widthAnchor.constraint(equalToConstant: 24),
               mapImage.heightAnchor.constraint(equalToConstant: 24),
               
               townLabel.leadingAnchor.constraint(equalTo: mapImage.trailingAnchor, constant: 15),
               townLabel.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor, constant: 29),
               
            strokaImage.leadingAnchor.constraint(equalTo: townLabel.trailingAnchor, constant: 22),
               strokaImage.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor, constant: 29),
               strokaImage.widthAnchor.constraint(equalToConstant: 8.49),
               strokaImage.heightAnchor.constraint(equalToConstant: 5.66),
        ])
        actionButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    actionButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 720),
                                actionButton.widthAnchor.constraint(equalToConstant: 250),
                                actionButton.heightAnchor.constraint(equalToConstant: 64)
                  
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
    @objc func scrollToTopAndNavigate() {
       
           let topOffset = CGPoint(x: 0, y: -scrollView.contentInset.top)
           scrollView.setContentOffset(topOffset, animated: true)

          
            let destinationViewController = WeatherViewController2()
            self.navigationController?.pushViewController(destinationViewController, animated: true)
       }

   
}
