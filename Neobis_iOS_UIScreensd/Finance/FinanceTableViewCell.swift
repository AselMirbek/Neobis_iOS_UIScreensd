
import UIKit

class FinanceTableViewCell: UITableViewCell {
            static let identifier = "FinanceTableViewCell"
       
        private let singleImage: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.tintColor = .label
            return iv
        }()

        private let titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 16, weight: .medium)
            return label
        }()

        private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.textColor = .gray
            label.textAlignment = .right
            label.font = .systemFont(ofSize: 14, weight: .regular)
            return label
        }()
    private let moneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
   
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUpUi()
            singleImage.setContentCompressionResistancePriority(.required, for: .horizontal)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func setUpUi() {
            contentView.addSubview(singleImage)
            contentView.addSubview(titleLabel)
            contentView.addSubview(descriptionLabel)
            contentView.addSubview(moneyLabel)
            singleImage.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            moneyLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                
                singleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                    singleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                    singleImage.heightAnchor.constraint(equalToConstant: 30),
                    singleImage.widthAnchor.constraint(equalToConstant: 30),
                
              
                
            
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                titleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: singleImage.trailingAnchor, constant: 20),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
                
                
                moneyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -15), //  отступ
                moneyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                moneyLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor,constant: 10),
                moneyLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
                
                descriptionLabel.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: -30), //  отступ
                descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor,constant: 10),
                descriptionLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor)
                
            ])
        }
       
        
    func configure(with image: UIImage, title: String, description: String,money: String) {
            self.singleImage.image = image
            self.titleLabel.text = title
            self.descriptionLabel.text = description
            self.moneyLabel.text = money
        }
}
