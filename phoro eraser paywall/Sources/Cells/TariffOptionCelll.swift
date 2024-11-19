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
            savingLabel.text = tariff?.savingPercentage?.rawValue
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

    private var savingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var durationPriceStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupView()
        
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 0, bottom: 3, right: 0))
        //backgroundColor = .clear

        setupHierarchy()
        setupLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setups

    private func setupHierarchy() {
        addSubview(durationPriceStack)
        durationPriceStack.addSubview(durationLabel)
        durationPriceStack.addSubview(priceLabel)
        addSubview(savingLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            durationPriceStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            durationPriceStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            durationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            durationPriceStack.heightAnchor.constraint(equalTo: contentView.heightAnchor),
           // durationPriceStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
           durationPriceStack.widthAnchor.constraint(equalToConstant: 200),

            durationLabel.leadingAnchor.constraint(equalTo: durationPriceStack.leadingAnchor),
            durationLabel.topAnchor.constraint(equalTo: durationPriceStack.topAnchor, constant: 3),

            priceLabel.leadingAnchor.constraint(equalTo: durationPriceStack.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor,constant: 3),
            //priceLabel.bottomAnchor.constraint(equalTo: durationLabel.bottomAnchor),

            savingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            savingLabel.leadingAnchor.constraint(equalTo: durationPriceStack.trailingAnchor, constant: 15),
            savingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            savingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
//            savingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
           // savingLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3.5)
            ])
    }

    private func setupView() {
        //selectionStyle = .none
        contentView.backgroundColor = !isSelected ? .systemPurple : .systemPink
        durationLabel.textColor = !isSelected ? .black : .white
        contentView.layer.cornerRadius = 10
    }
}
