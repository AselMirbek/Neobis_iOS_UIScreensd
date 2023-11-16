
import UIKit

class CryptoTableViewCell: UITableViewCell {
    static let identifier = "CryptoTableViewCell"
   
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
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()

    private let procentsLabelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    private let labelCostDollar: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    private let namedCostForDollar: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 12, weight: .regular)
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
        contentView.addSubview(procentsLabelTitle)
        contentView.addSubview(labelCostDollar)
        contentView.addSubview(namedCostForDollar)
        singleImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        procentsLabelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelCostDollar.translatesAutoresizingMaskIntoConstraints = false
        namedCostForDollar.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            singleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //singleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
           singleImage.heightAnchor.constraint(equalToConstant:56 ),
            singleImage.widthAnchor.constraint(equalToConstant: 56),
           
            singleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            singleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -300),
            
            
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: singleImage.trailingAnchor, constant:-15),
           // titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -50),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
            procentsLabelTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -40), //  отступ
            procentsLabelTitle.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            procentsLabelTitle.leadingAnchor.constraint(equalTo: singleImage.trailingAnchor, constant: -15), //  отступ
            procentsLabelTitle.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),

            
            labelCostDollar.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            labelCostDollar.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor,constant:255),
            labelCostDollar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -20),
            labelCostDollar.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
            
            namedCostForDollar.topAnchor.constraint(equalTo:  labelCostDollar.bottomAnchor, constant: -65), //  отступ
            namedCostForDollar.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            namedCostForDollar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant:250), //  отступ
            namedCostForDollar.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
     
        ])
    }
    
    func configure(with image: UIImage, title: String,procentLabel: String, labelDollar: String,  namedDollar: String) {
        self.singleImage.image = image
        self.titleLabel.text = title
        self.procentsLabelTitle.text = procentLabel
        self.labelCostDollar.text = labelDollar
        self.namedCostForDollar.text = namedDollar
    }
}




