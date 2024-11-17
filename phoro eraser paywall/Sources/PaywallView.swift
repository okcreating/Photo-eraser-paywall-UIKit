//
//  PaywallView.swift
//  phoro eraser paywall
//
//  Created by Oksana Kazarinova on 13/11/2024.
//

import UIKit

class PaywallView: UIView {

    // MARK: - Outlets

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
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var featuresCollection: UICollectionView = {
        let collection = UICollectionView(frame: .infinite, collectionViewLayout: UICollectionViewLayout.init())

        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    lazy var tariffsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.tintColor = .white
        button.backgroundColor = .systemIndigo
        button.setTitle("Try Free", for: .normal)
        button.addTarget(self, action: #selector(PaywallViewController.buyButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
       //backgroundColor = UIColor(patternImage: UIImage(named: "back") ?? )
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(image)
        addSubview(title)
        addSubview(featuresCollection)
        addSubview(tariffsTableView)
        addSubview(buyButton)
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

            tariffsTableView.topAnchor.constraint(equalTo: featuresCollection.bottomAnchor, constant: 10),
//            tariffsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            tariffsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tariffsTableView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tariffsTableView.widthAnchor.constraint(equalTo: self.widthAnchor),
            tariffsTableView.heightAnchor.constraint(equalToConstant: 200),

            buyButton.topAnchor.constraint(equalTo: tariffsTableView.bottomAnchor, constant: 10),
            buyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buyButton.widthAnchor.constraint(equalToConstant: 270),
            buyButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
