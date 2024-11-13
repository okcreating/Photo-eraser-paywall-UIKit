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
    case year = "£59,99 per year"

}

enum SavingPercentage: String {
    case forty = "save 40%"
    case seventy = "save 70%"
}

// MARK: Model

struct Tariff {
    var subscriptionDuration: SubscriptionDurations
    var price: Prices
    var savingPercentage: SavingPercentage?
}

// MARK: Building Model

final class SubscriptionOptions {
    func BuildTariffs() -> [Tariff] {
        return [
            Tariff(subscriptionDuration: .trial, price: .week),
            Tariff(subscriptionDuration: .month, price: .month, savingPercentage: .forty),
            Tariff(subscriptionDuration: .year, price: .year, savingPercentage: .seventy)
        ]
    }
}
