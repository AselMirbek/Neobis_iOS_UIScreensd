
import UIKit

class FinanceTabBar: UITabBarController {

    override func viewDidLoad() {
               super.viewDidLoad()
               
               
        tabBar.barTintColor = UIColor(red: 0xF2/255.0, green: 0xF2/255.0, blue: 0xF2/255.0, alpha: 0xE5/255.0)
               tabBar.isTranslucent = false
               tabBar.layer.borderWidth = 1
               tabBar.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
               
              
               addButtonWithIcon(title: "Главная", imageName: "FinanceTabBarImage1", x: 0)
               addButtonWithIcon(title: "Отчеты", imageName: "FinanceTabBarImage2", x: 1)
               addButtonWithIcon(title: "Профиль", imageName: "FinanceTabBarImage3", x: 2)
           }
           
           private func addButtonWithIcon(title: String, imageName: String, x: Int) {
               // Button
               let button = UIButton(type: .system)
               button.setTitle(title, for: .normal)
               button.frame = CGRect(x: tabBar.frame.width / 3 * CGFloat(x), y: 0, width: tabBar.frame.width / 3, height: 90)
               button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
               button.setTitleColor(.darkGray, for: .normal)
                   button.setTitleColor(.black, for: .highlighted)
               
               // Icon
               let iconImageView = UIImageView()
               let iconImage = UIImage(named: imageName)
               iconImageView.image = iconImage
               iconImageView.contentMode = .scaleAspectFit
              
               iconImageView.frame = CGRect(x: tabBar.frame.width / 3 * CGFloat(x), y: (80 - 25) / 4, width: tabBar.frame.width / 3, height: 24)
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

