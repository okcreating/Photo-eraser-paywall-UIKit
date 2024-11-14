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
        translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Unlock all features"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var advantagesCollection: UICollectionView = {
        let collection = UICollectionView()
       // collection.dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    lazy var tariffsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
//        tableView.dataSource = self
//        tableView.delegate = self
        return tableView
    }()

    lazy var buyButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 44))
        button.layer.cornerRadius = 10
        button.titleLabel?.text = 
        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
       // backgroundColor = UIColor(patternImage: UIImage(named: "back") ?? )
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(tariffsTableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            advantagesCollection.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            advantagesCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            advantagesCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            tariffsTableView.topAnchor.constraint(equalTo: advantagesCollection.bottomAnchor, constant: 10),
            tariffsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tariffsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
           // tariffsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
