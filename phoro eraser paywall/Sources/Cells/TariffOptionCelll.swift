//
//  TariffOptionCelll.swift
//  phoro eraser paywall
//
//  Created by Oksana Kazarinova on 13/11/2024.
//

import UIKit

final class TariffCell: UITableViewCell {

    static let identifier = "TariffCell"

    var tariff: Tariff? {
        didSet {
            durationLabel.text = tariff?.subscriptionDuration.rawValue
            priceLabel.text = tariff?.price.rawValue
            //savingLabel.text = tariff?.savingPercentage?.rawValue
            savingLabel.image = UIImage(named: tariff?.saving?.rawValue ?? "")
        }
    }

    // MARK: Outlets

    private var durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//    private var savingLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
        //label.layer.frame = CGRect(x: 0, y: 0, width: label.frame.width + 10, height: label.frame.height + 10)
//        label.layer.cornerRadius = 10
//
//label.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//        label.layer.backgroundColor = UIColor.red.cgColor
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()

    private var savingLabel: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var durationPriceStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemPurple
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0))
        layer.cornerRadius = 10
        setupHierarchy()
        setupLayout()
       // setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setups

    private func setupHierarchy() {
        durationPriceStack.addSubview(priceLabel)
        durationPriceStack.addSubview(durationLabel)
        addSubview(durationPriceStack)
        addSubview(savingLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            durationPriceStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            durationPriceStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            durationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
           // durationPriceStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            durationPriceStack.widthAnchor.constraint(equalToConstant: 200),

            durationLabel.leadingAnchor.constraint(equalTo: durationPriceStack.leadingAnchor),
            durationLabel.topAnchor.constraint(equalTo: durationPriceStack.topAnchor),

            priceLabel.leadingAnchor.constraint(equalTo: durationPriceStack.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 4),
            //priceLabel.bottomAnchor.constraint(equalTo: durationPriceStack.bottomAnchor),

            savingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            savingLabel.leadingAnchor.constraint(equalTo: durationPriceStack.trailingAnchor, constant: 15),
//            savingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
//            savingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
          savingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
    }

    private func setupView() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = !isSelected ? .systemPurple : .systemPink
        durationLabel.textColor = !isSelected ? .black : .white
    }
}
