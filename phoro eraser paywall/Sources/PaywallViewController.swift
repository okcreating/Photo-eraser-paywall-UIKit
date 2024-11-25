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

    @objc
    func termsOfUseButtonTapped() {
        if let url = URL(string: PoliciesLinks.termsOfUse.rawValue), UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
          print("Invalid URL or unable to open.")
        }
    }

    @objc
    func restoreButtonTapped() {
//        progressHUD?.show()
//        PurchaisesManager.shared.restore {  [weak self] isSubscribed in
//            guard let self = self else {return}
//            DispatchQueue.main.async {
//                self.progressHUD?.hide()
//                if isSubscribed {
//                    self.presenter?.coordinator?.routeToMainController()
//                } else {
//                   self.presenter?.coordinator?.showAlertWith(title: "Error occurred", message: "Please try again")
//                }
//            }
//        }
    }

    @objc
    func privacyPolicyButtonTapped() {
        if let url = URL(string: PoliciesLinks.privacyPolicy.rawValue), UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
          print("Invalid URL or unable to open.")
        }
    }

    private func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "back")
       // backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
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
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.init(hex: "#FF0080")
        cell?.selectedBackgroundView = bgColorView

            cell?.durationLabel.textColor = .white
            cell?.priceLabel.textColor = UIColor.init(hex: "#624CE6")
       // } else {
   //         cell?.durationLabel.textColor = .black
  //          cell?.priceLabel.textColor = .white
 //           cell?.backgroundColor = UIColor.init(hex: "#624CE6")
//        }
       return cell ?? TariffCell()
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       let cell = cell as? TariffCell

//        cell?.durationLabel.textColor = .white
//              cell?.priceLabel.textColor = UIColor.init(hex: "#624CE6")
//             cell?.backgroundColor = UIColor.init(hex: "#FF0080")
       // tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.section == 0 {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as? TariffCell
    //    cell?.setSelected(true, animated: true)
//        cell?.durationLabel.textColor = .white
//        cell?.priceLabel.textColor = UIColor.init(hex: "#624CE6")
//        cell?.backgroundColor = UIColor.init(hex: "#FF0080")

        switch indexPath.section {
        case 0:
            paywallView.buyButton.setTitle("Try Free", for: .normal)
        case 1, 2:
            paywallView.buyButton.setTitle("Buy Subscription", for: .normal)
        default:
            break
        }
       // tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
       // tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
   //tableView.deselectRow(at: indexPath, animated: true)
//        let cell = tableView.cellForRow(at: indexPath) as? TariffCell
//        cell?.setSelected(false, animated: true)
//        cell?.durationLabel.textColor = .black
//        cell?.priceLabel.textColor = .white
//        cell?.backgroundColor = UIColor.init(hex: "#624CE6")
//       tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
//        tableView.reloadData()
    }
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

