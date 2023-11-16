
import UIKit

class WeatherTableViewCell: UITableViewCell {

    static let identifier = "WeatherTableViewCell"

private let weatherImage: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.tintColor = .label
    return iv
}()

private let dateLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    return label
}()

private let gradusLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.textAlignment = .right
    label.font = UIFont(name: "Overpass-Regular", size: 18)
    return label
}()


override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUpUi()
    weatherImage.setContentCompressionResistancePriority(.required, for: .horizontal)
    backgroundColor = .clear
    
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

func setUpUi() {
    contentView.addSubview(weatherImage)
    contentView.addSubview(dateLabel)
    contentView.addSubview(gradusLabel)
   weatherImage.translatesAutoresizingMaskIntoConstraints = false
    gradusLabel.translatesAutoresizingMaskIntoConstraints = false
    dateLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        
        weatherImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 155),
            weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            weatherImage.heightAnchor.constraint(equalToConstant: 70),
            weatherImage.widthAnchor.constraint(equalToConstant: 70),
        
      
        
    
        gradusLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
       // gradusLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
        gradusLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: -70),
        gradusLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
        
        
        dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor), //  отступ
       // dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        dateLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
        dateLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor,constant: -5)
        
    ])
}


func configure(with image: UIImage, date: String,gradus: String) {
    self.weatherImage.image = image
    self.dateLabel.text = date
    self.gradusLabel.text = gradus
}


}
