
import UIKit

class TravelTableViewCell: UITableViewCell {
    static let identifier = "TravelTableViewCell"
    
    private let singleImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label

       
        return iv
    }()
    
    private let buttonLabels: UILabel = {
           let label = UILabel()
           label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
           return label
       }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUi()
        singleImage.setContentCompressionResistancePriority(.required, for: .horizontal)
        buttonLabels.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
           super.layoutSubviews()
           configureGradient()
        // red under label
        let borderLayer = CALayer()
               borderLayer.backgroundColor = UIColor.red.cgColor
               borderLayer.frame = CGRect(x: 0, y: buttonLabels.bounds.height - 2, width: buttonLabels.bounds.width, height: 2)

              
               buttonLabels.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

               buttonLabels.layer.addSublayer(borderLayer)
        
       }
    
    func setUpUi() {
        contentView.addSubview(singleImage)
        
        contentView.addSubview(buttonLabels)
        singleImage.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLabels.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            singleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //singleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            singleImage.heightAnchor.constraint(equalToConstant:230 ),
            singleImage.widthAnchor.constraint(equalToConstant: 354),
            singleImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
           // singleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
            
            buttonLabels.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 30),
            buttonLabels.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
           
            
        ])
    }
    
    
    func configure(with image: UIImage,labelText: String) {
        self.singleImage.image = image
        self.createButton(with: labelText)
        
    }
    private func createButton(with labelText: String) {
        self.buttonLabels.text = labelText
        
    }
    private func configureGradient() {
          
           singleImage.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }

          
        let gradientLayer = CAGradientLayer()
           gradientLayer.frame = singleImage.bounds
           gradientLayer.colors = [UIColor(white: 0, alpha: 0.49).cgColor, UIColor.clear.cgColor]
           gradientLayer.locations = [0.0, 0.3542]
           gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
           gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
           // gradinet
           singleImage.layer.addSublayer(gradientLayer)
       }
}
