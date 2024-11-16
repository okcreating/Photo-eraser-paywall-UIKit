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
            savingLabel.text = tariff?.price.rawValue
        }
    }

    // MARK: Outlets

    private var durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var savingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var durationPriceStack: UIStackView = {
        let stack = UIStackView(frame: CGRect(x: 0, y: 0, width: 150, height: 60))
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupHierarchy()
        setupLayout()
        setupView()
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
            durationPriceStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            durationPriceStack.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            savingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            savingLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            savingLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3)
            ])
    }

    private func setupView() {
        //selectionStyle = .none
        contentView.backgroundColor = !isSelected ? .systemPurple : .systemPink
        durationLabel.textColor = !isSelected ? .black : .white
        contentView.layer.cornerRadius = 10
    }
}
