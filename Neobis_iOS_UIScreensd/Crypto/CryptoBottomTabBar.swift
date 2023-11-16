

import UIKit

class CryptoBottomTabBar: UITabBarController {

    override func viewDidLoad() {
               super.viewDidLoad()
               
        tabBar.barTintColor = UIColor.white
               tabBar.isTranslucent = false
        tabBar.layer.borderWidth = 0.3
               tabBar.layer.borderColor = UIColor.gray.withAlphaComponent(0.1).cgColor
            
               addButtonWithIcon(imageName: "TabBarImage1", x: 0)
               addButtonWithIcon(imageName: "TabBarImage2", x: 1)
               addButtonWithIcon(imageName: "TabBarImage3", x: 2)
           }
           
    private func addButtonWithIcon(imageName: String, x: Int) {
        // Icon
        let iconImageView = UIImageView()
        let iconImage = UIImage(named: imageName)
        iconImageView.image = iconImage
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.frame = CGRect(x: tabBar.frame.width / 3 * CGFloat(x), y: (80 - 25) / 2.5, width: tabBar.frame.width / 3, height: 25)
        iconImageView.layer.cornerRadius = 4

        
    tabBarIcons.append(iconImageView)
        updateTabBar()
           }
           
     
           private var tabBarIcons = [UIImageView]()
           
           
    private func updateTabBar(){
        
        tabBarIcons.forEach { tabBar.addSubview($0) }
    }
       }
