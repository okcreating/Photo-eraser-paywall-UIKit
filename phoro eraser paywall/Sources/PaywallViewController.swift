//
//  ViewController.swift
//  phoro eraser paywall
//
//  Created by Oksana Kazarinova on 13/11/2024.
//

import Foundation
import UIKit

class PaywallViewController: UIViewController {

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
    }

//    private func changeBuyButtonText() -> String {
//        
//    }
}

private extension PaywallViewController {
    func configureAdvantagesCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width / 2.2, height: 44)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
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
        tafiffsModel?.buildTariffs().count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = tafiffsModel?.buildTariffs()[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TariffCell.identifier, for: indexPath) as? TariffCell
        cell?.tariff = model
        return cell ?? TariffCell()
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension PaywallViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        featuresModel?.getFeatures().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = featuresModel?.getFeatures()[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeatureCell.identifier, for: indexPath) as? FeatureCell
        cell?.feature = model
        return cell ?? FeatureCell()
    }
    

}

