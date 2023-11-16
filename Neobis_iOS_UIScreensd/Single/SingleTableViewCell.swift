
import UIKit
class SingleTableViewCell: UITableViewCell {
    static let identifier = "SingleTableViewCell"
    var isEvenCell: Bool = false {
           didSet {
              updateLayout()
           }
       }
    private let singleImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label
        return iv
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0 // перевод строку
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private let actionButton: UIButton = {
            let button = UIButton()
            let buttonImage = UIImage(named: "buttonTableView")
            button.setImage(buttonImage, for: .normal)
            return button
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
        contentView.addSubview(actionButton)
        singleImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            singleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //singleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
           singleImage.heightAnchor.constraint(equalToConstant:90 ),
            singleImage.widthAnchor.constraint(equalToConstant: 90),
           
          
            
        
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -50),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -120), //  отступ
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
      
            actionButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 75),
                      actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                      actionButton.widthAnchor.constraint(equalToConstant: 30),
                      actionButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    func updateLayout() {
        if isEvenCell {
            // Photo on the right, text on the left
            NSLayoutConstraint.deactivate([
                singleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -220),
                singleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                
                titleLabel.leadingAnchor.constraint(equalTo: singleImage.trailingAnchor, constant: 10),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
                
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
                descriptionLabel.leadingAnchor.constraint(equalTo: singleImage.trailingAnchor, constant: 10)
                       ])
                       NSLayoutConstraint.activate([
   singleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:200),
   singleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
   titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
   titleLabel.trailingAnchor.constraint(equalTo: singleImage.trailingAnchor, constant:3),
   descriptionLabel.trailingAnchor.constraint(equalTo: singleImage.leadingAnchor, constant: 3),
   descriptionLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
                       ])
                   } else {
                       // Photo on the left, text on the right
                       NSLayoutConstraint.deactivate([
   singleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:200),
   singleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
   titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
   titleLabel.trailingAnchor.constraint(equalTo: singleImage.trailingAnchor, constant:5),
   descriptionLabel.trailingAnchor.constraint(equalTo: singleImage.leadingAnchor, constant: 5),
   descriptionLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
                       ])
                       NSLayoutConstraint.activate([
                           singleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -220),
                           singleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                           
                           titleLabel.leadingAnchor.constraint(equalTo: singleImage.trailingAnchor, constant: 10),
                           titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
                           
                           descriptionLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor,constant: -15),
                           descriptionLabel.leadingAnchor.constraint(equalTo: singleImage.trailingAnchor, constant: 10)
                       ])
                   }
  }
    
    func configure(with image: UIImage, title: String, description: String) {
        self.singleImage.image = image
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}

