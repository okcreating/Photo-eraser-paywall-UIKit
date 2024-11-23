//
//  Paywall Model.swift
//  phoro eraser paywall
//
//  Created by Oksana Kazarinova on 13/11/2024.
//

import Foundation

// MARK: Properties

enum PoliciesLinks: String {
    case termsOfUse = "https://tasty-mercury-b07.notion.https://tasty-mercury-b07.notion.site/Terms-and-Conditions-The-remove-objects-eraser-app-f6c71fd814bd4902bd8b814c3f0efb4d?pvs=4"
    case privacyPolicy = "https://tasty-mercury-b07.notion.site/The-remove-objects-eraser-app-APP-PRIVACY-POLICY-17b35454f01745ad8b2eb50ff74862fd?pvs=4"
}

enum SubscriptionDurations: String {
    case trial = "3 day free trial"
    case month = "Monthly"
    case year = "Yearly"
}

enum Prices: String {
    case week = "$4,99 per week"
    case month = "$12,99 per month"
    case year = "$59,99 per year"
}

//enum SavingPercentage: String {
//    case forty = "save 40%"
//    case seventy = "save 70%"
//}

enum SavingImages: String {
    case forty = "Save40"
    case seventy = "Save70"
}

enum Feature: String {
    case removeObjects = "Remove Objects"
    case resizePhoto = "Resize photo"
    case eraseObjects = "Erase objects"
    case noAds = "No ads"
}

// MARK: Models

struct Tariff {
    var subscriptionDuration: SubscriptionDurations
    var price: Prices
    //var savingPercentage: SavingPercentage?
    var saving: SavingImages?
}

struct FeatureContent {
    var text: Feature
}

// MARK: Building Model

final class SubscriptionOptions {
    func buildTariffs() -> [[Tariff]] {
        return [
//            [Tariff(subscriptionDuration: .trial, price: .week)],
//            [Tariff(subscriptionDuration: .month, price: .month, savingPercentage: .forty)],
//            [Tariff(subscriptionDuration: .year, price: .year, savingPercentage: .seventy)]
            [Tariff(subscriptionDuration: .trial, price: .week)],
            [Tariff(subscriptionDuration: .month, price: .month, saving: .forty)],
            [Tariff(subscriptionDuration: .year, price: .year, saving: .seventy)]
        ]
    }
}

final class Features {
    func getFeatures() -> [FeatureContent] {
        return [
            FeatureContent(text: .removeObjects),
            FeatureContent(text: .resizePhoto),
            FeatureContent(text: .eraseObjects),
            FeatureContent(text: .noAds)
        ]
    }
}
