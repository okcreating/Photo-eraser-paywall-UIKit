//
//  PaywallView.swift
//  phoro eraser paywall
//
//  Created by Oksana Kazarinova on 13/11/2024.
//

import UIKit

class PaywallView: UIView {

    // MARK: - Outlets

    let buttonColor: UIColor = UIColor(red: 0.483, green: 0.483, blue: 0.483, alpha: 1)

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Paywall Image")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Unlock all features"
        label.textColor = .white
        label.font = UIFont(name: "Poppins-SemiBold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var featuresCollection: UICollectionView = {
        let collection = UICollectionView(frame: .infinite, collectionViewLayout: UICollectionViewLayout.init())
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    lazy var tariffsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.backgroundColor = UIColor.init(hex: "#624CE6")
        button.setTitle("Try Free", for: .normal)
        button.titleLabel?.font = UIFont(name: "Urbanist-Bold", size: 18)
        button.addTarget(self, action: #selector(PaywallViewController.buyButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var termsOfUseButton: UIButton = {
      let button = UIButton()
      button.setTitle("Terms", for: .normal)
      button.setTitleColor(buttonColor, for: .normal)
      // Установка цвета текста для состояния highlighted (когда кнопка нажата)
      button.setTitleColor(buttonColor, for: .highlighted)
      button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
        button.addTarget(self, action: #selector(PaywallViewController.termsOfUseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    private lazy var restoreButton: UIButton = {
      let button = UIButton()
      button.setTitle("Restore", for: .normal)
      button.setTitleColor(buttonColor, for: .normal)
      button.setTitleColor(buttonColor, for: .highlighted)
      button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
        button.addTarget(self, action: #selector(PaywallViewController.restoreButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    private lazy var privacyPolicyButton: UIButton = {
      let button = UIButton()
      button.setTitle("Privacy", for: .normal)
      button.setTitleColor(buttonColor, for: .normal)
      button.setTitleColor(buttonColor, for: .highlighted)
      button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
    button.addTarget(self, action: #selector(PaywallViewController.privacyPolicyButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        let subviews = [image, title, featuresCollection, tariffsTableView, buyButton, termsOfUseButton, restoreButton, privacyPolicyButton]
        subviews.forEach(addSubview)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            featuresCollection.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            featuresCollection.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            featuresCollection.widthAnchor.constraint(equalTo: self.widthAnchor),
            featuresCollection.heightAnchor.constraint(equalToConstant: 100),

            tariffsTableView.topAnchor.constraint(equalTo: featuresCollection.bottomAnchor),
//            tariffsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            tariffsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tariffsTableView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tariffsTableView.widthAnchor.constraint(equalTo: self.widthAnchor),
            tariffsTableView.heightAnchor.constraint(equalToConstant: 250),

            buyButton.topAnchor.constraint(equalTo: tariffsTableView.bottomAnchor, constant: 20),
            buyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buyButton.widthAnchor.constraint(equalToConstant: 270),
            buyButton.heightAnchor.constraint(equalToConstant: 55),

            restoreButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            restoreButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            privacyPolicyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            privacyPolicyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -35),

            termsOfUseButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            termsOfUseButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 35)
        ])
    }
}
