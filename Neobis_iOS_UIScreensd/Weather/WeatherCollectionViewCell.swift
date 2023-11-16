
import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    static let identifier = "WeatherCollectionViewCell"
    private let overlayView: UIView = {
           let view = UIView()
           view.backgroundColor = UIColor(white: 1, alpha: 0.2)
           view.layer.cornerRadius = 20
           view.isHidden = true
           return view
       }()
    private let gradusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        return label
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        return label
    }()
    private let weatherImage: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.tintColor = .label
            return iv
        }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        weatherImage.setContentCompressionResistancePriority(.required, for: .horizontal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var isSelected: Bool {
        didSet {
           
            overlayView.isHidden = !isSelected
        }
    }

    private func setupUI() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(gradusLabel)
        contentView.addSubview(weatherImage)
        contentView.addSubview(overlayView)

              
                overlayView.translatesAutoresizingMaskIntoConstraints = false
            
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        gradusLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overlayView.topAnchor.constraint(equalTo: contentView.topAnchor),
            overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            weatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                weatherImage.heightAnchor.constraint(equalToConstant: 70),
                weatherImage.widthAnchor.constraint(equalToConstant: 70),
    
            
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor,constant: 15),
            gradusLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            gradusLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            
            
            
            
            
        ])
    }

    func configure(with image: UIImage, time: String,gradus: String) {
        weatherImage.image = image
        timeLabel.text = time
        gradusLabel.text = gradus
    }
}

 
