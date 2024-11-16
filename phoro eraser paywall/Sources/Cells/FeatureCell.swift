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
        image.contentMode = .scaleAspectFit
     image.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var advantageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        return stack
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
//        addSubview(tickIcon)
//        addSubview(advantageLabel)

        stack.addSubview(tickIcon)
        stack.addSubview(advantageLabel)
        addSubview(stack)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            tickIcon.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            tickIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            tickIcon.widthAnchor.constraint(equalToConstant: 30),
//            tickIcon.heightAnchor.constraint(equalToConstant: 30),
//            tickIcon.topAnchor.constraint(equalTo: stack.topAnchor),
//            tickIcon.bottomAnchor.constraint(equalTo: stack.bottomAnchor),

            advantageLabel.leadingAnchor.constraint(equalTo: tickIcon.trailingAnchor, constant: 5),
          advantageLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            advantageLabel.topAnchor.constraint(equalTo: stack.topAnchor, constant: 5),
//            advantageLabel.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -5),

            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
