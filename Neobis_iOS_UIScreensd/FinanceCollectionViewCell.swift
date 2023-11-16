// CollectionViewSlider.swift
import UIKit

class FinanceCollectionViewCell: UICollectionViewCell {
    static let identifier = "FinanceCollectionViewCell"

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 8, weight: .bold)
        return label
    }()

    var fontSize: CGFloat = 8 {
        didSet {
            label.font = .systemFont(ofSize: fontSize, weight: .bold)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }

    func configure(with text: String) {
        label.text = text
    }
}
