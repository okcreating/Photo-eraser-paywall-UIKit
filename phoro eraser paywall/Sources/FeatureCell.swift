//
//  AdvantageCell.swift
//  phoro eraser paywall
//
//  Created by Oksana Kazarinova on 15/11/2024.
//

import UIKit

final class FeatureCell: UICollectionViewCell {
    
    static let identifier = "FeatureCell"

    var feature: FeatureContent? {
        didSet {
            advantageLabel.text = feature?.text.rawValue
        }
    }

    private var tickIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Tick"))
        return image
    }()

    private var advantageLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        addSubview(tickIcon)
        addSubview(advantageLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            tickIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            tickIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            tickIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),

            advantageLabel.leadingAnchor.constraint(equalTo: tickIcon.trailingAnchor, constant: 5),
            advantageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            advantageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}
