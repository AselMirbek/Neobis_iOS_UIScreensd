//
//  FinanceUIStackView.swift
//  Neobis_iOS_UIScreensd
//
//  Created by Interlink on 20/11/23.
//

import UIKit
protocol ButtonActionsDelegate: AnyObject {
    func backButtonTapped()
    func forwardButtonTapped()
}

class FinanceUIStackView: UIView {


        weak var delegate: ButtonActionsDelegate?

        private let backButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Back", for: .normal)
            button.addTarget(FinanceUIStackView.self, action: #selector(backButtonTapped), for: .touchUpInside)
            return button
        }()

        private let forwardButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Forward", for: .normal)
            button.addTarget(FinanceUIStackView.self, action: #selector(forwardButtonTapped), for: .touchUpInside)
            return button
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupUI() {
            let stackView = UIStackView(arrangedSubviews: [backButton, UIView(), forwardButton])
            stackView.axis = .horizontal
            stackView.spacing = 20.0
            stackView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            ])
        }

        @objc private func backButtonTapped() {
            delegate?.backButtonTapped()
        }

        @objc private func forwardButtonTapped() {
            delegate?.forwardButtonTapped()
        }
    }


