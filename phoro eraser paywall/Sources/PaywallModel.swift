//
//  Paywall Model.swift
//  phoro eraser paywall
//
//  Created by Oksana Kazarinova on 13/11/2024.
//

import Foundation

// MARK: Properties

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

enum SavingPercentage: String {
    case forty = "save 40%"
    case seventy = "save 70%"
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
    var savingPercentage: SavingPercentage?
}

struct FeatureContent {
    var text: Feature
}

// MARK: Building Model

final class SubscriptionOptions {
    func buildTariffs() -> [[Tariff]] {
        return [
            [Tariff(subscriptionDuration: .trial, price: .week)],
            [Tariff(subscriptionDuration: .month, price: .month, savingPercentage: .forty)],
            [Tariff(subscriptionDuration: .year, price: .year, savingPercentage: .seventy)]
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
