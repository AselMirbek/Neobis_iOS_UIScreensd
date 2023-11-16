
import UIKit
class BottomTabBar: UITabBarController {
 override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set the background color of the tab bar
            tabBar.barTintColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 0.9)
            tabBar.isTranslucent = false
            tabBar.layer.borderWidth = 1
            tabBar.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
            
          
            addButtonWithIcon(title: "Series", imageName: "Image1Bar", x: 0)
            addButtonWithIcon(title: "Headspace", imageName: "Image2Bar", x: 1)
            addButtonWithIcon(title: "Profile", imageName: "Image3Bar", x: 2)
        }
        
        private func addButtonWithIcon(title: String, imageName: String, x: Int) {
            // Button
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.frame = CGRect(x: tabBar.frame.width / 3 * CGFloat(x), y: 0, width: tabBar.frame.width / 3, height: 95)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            button.setTitleColor(.darkGray, for: .normal)  // Set the default text color
                button.setTitleColor(.black, for: .highlighted)
            
            // Icon
            let iconImageView = UIImageView()
            let iconImage = UIImage(named: imageName)
            iconImageView.image = iconImage
            iconImageView.contentMode = .scaleAspectFit
            iconImageView.frame = CGRect(x: tabBar.frame.width  / 3 * CGFloat(x), y: 0, width:tabBar.frame.width / 3, height: 35)
            iconImageView.layer.cornerRadius = 4
            
            // Add to arrays
            tabBarButtons.append(button)
            tabBarIcons.append(iconImageView)
            
            // Update tabBar
            updateTabBar()
        }
        
        private var tabBarButtons = [UIButton]()
        private var tabBarIcons = [UIImageView]()
        
        @objc private func buttonTapped(sender: UIButton) {
            // Handle button tap
            print("Button tapped: \(sender.titleLabel?.text ?? "")")
        }
        
        private func updateTabBar() {
            tabBarButtons.forEach { tabBar.addSubview($0) }
            tabBarIcons.forEach { tabBar.addSubview($0) }
        }
    }

