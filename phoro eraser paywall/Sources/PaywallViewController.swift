//
//  ViewController.swift
//  phoro eraser paywall
//
//  Created by Oksana Kazarinova on 13/11/2024.
//

import Foundation
import UIKit

class PaywallViewController: UIViewController, UICollectionViewDelegate {

    var featuresModel: Features?
    var tafiffsModel: SubscriptionOptions?

    private weak var paywallView: PaywallView! {
        guard isViewLoaded else { return nil }
        return (view as? PaywallView)
    }

    override func viewDidLoad() {
        view = PaywallView()
        super.viewDidLoad()
        tafiffsModel = SubscriptionOptions()
        featuresModel = Features()
        configureAdvantagesCollection()
        configureTariffsTableView()
        setBackgroundImage()
    }

    @objc
    func buyButtonPressed() {}

    private func setBackgroundImage() {

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "back")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
}

private extension PaywallViewController {
    func configureAdvantagesCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 160, height: 40)
        layout.minimumLineSpacing = 7
        layout.minimumInteritemSpacing = 7
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        paywallView.featuresCollection.collectionViewLayout = layout
        paywallView.featuresCollection.register(FeatureCell.self, forCellWithReuseIdentifier: FeatureCell.identifier)
        paywallView.featuresCollection.dataSource = self
        paywallView.featuresCollection.isUserInteractionEnabled = false
    }

    func configureTariffsTableView() {
        paywallView.tariffsTableView.register(TariffCell.self, forCellReuseIdentifier: TariffCell.identifier)
        paywallView.tariffsTableView.dataSource = self
        paywallView.tariffsTableView.delegate = self
    }
}

extension PaywallViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       tafiffsModel?.buildTariffs()[section].count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        tafiffsModel?.buildTariffs().count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = tafiffsModel?.buildTariffs()[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TariffCell.identifier, for: indexPath) as? TariffCell
        cell?.tariff = model
        return cell ?? TariffCell()
    }
//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension PaywallViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        featuresModel?.getFeatures().count ?? 0
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = featuresModel?.getFeatures()[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeatureCell.identifier, for: indexPath) as? FeatureCell
        cell?.directionalLayoutMargins = NSDirectionalEdgeInsets()
        cell?.feature = model
        return cell ?? FeatureCell()
    }
}

