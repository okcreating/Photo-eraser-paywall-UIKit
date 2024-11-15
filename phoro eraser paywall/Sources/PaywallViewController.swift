//
//  ViewController.swift
//  phoro eraser paywall
//
//  Created by Oksana Kazarinova on 13/11/2024.
//

import Foundation
import UIKit

class PaywallViewController: UIViewController {

    var model: SubscriptionOptions?

    private weak var paywallView: PaywallView! {
        guard isViewLoaded else { return nil }
        return (view as? PaywallView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        model = SubscriptionOptions()
        view = PaywallView()
        configureAdvantagesCollection()
        configureTariffsTableView()
    }

    private func changeBuyButtonText() -> String {
        
    }
}

private extension PaywallViewController {
    func configureAdvantagesCollection() {
        let layout = UICollectionViewFlowLayout()
        paywallView.advantagesCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        paywallView.advantagesCollection.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
        paywallView.advantagesCollection?.dataSource = self
        paywallView.advantagesCollection?.isUserInteractionEnabled = false
    }

    func configureTariffsTableView() {
        paywallView.tariffsTableView.register(TariffCell.self, forCellReuseIdentifier: TariffCell.identifier)
        paywallView.tariffsTableView.dataSource = self
        paywallView.tariffsTableView.delegate = self
    }
}

extension PaywallViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?.buildTariffs().count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model?.buildTariffs()[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TariffCell.identifier, for: indexPath) as? TariffCell
        cell?.tariff = model
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}

extension PaywallViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    

}

