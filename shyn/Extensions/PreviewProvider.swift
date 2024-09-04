////
////  PreviewProvider.swift
////  SwiftfulCrypto
////
////  Created by Nick Sarno on 5/9/21.
////
//
import Foundation
import SwiftUI
import Firebase

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    let user: User
    let holding: Holding
    
    private init() {
        let holding1 = Holding(coinID: coin.id, amount: 0.75, averageCost: 40000)
        self.holding = holding1
        let portfolio = Portfolio(holdings: [holding1, holding1, holding1, holding1])
        let user = User(uid: NSUUID().uuidString, fullname: "Stephan Dowless", email: "dowless.stephan@gmail.com", portfolio: portfolio)
        self.user = user
    }
    
    let viewModel = HomeViewModel()

    let stat1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let stat2 = StatisticModel(title: "Total Volume", value: "$1.23Tr")
    let stat3 = StatisticModel(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
    
    let transactionDetail = Transaction(id: NSUUID().uuidString, type: .buy, date: Timestamp(date: Date()),
                                        price: 1.49, quantity: 1000, fee: 2.0, cost: 1490, coinID: "cardano")
    
    let coin = Coin(
       id: "shiny",
       symbol: "shyn",
       name: "SHINY",
       image: "https://shinygermany.io/images/logos/shyntoken.svg",
       currentPrice: 0.30,
       marketCap: 43590000,
       marketCapRank: 0,
       fullyDilutedValuation: 0,
       totalVolume: 0,
       high24H: 0.30,
       low24H: 0.30,
       priceChange24H: 0,
       priceChangePercentage24H: 0,
       marketCapChange24H: 0,
       marketCapChangePercentage24H: 0,
       circulatingSupply: 0,
       totalSupply: 145300000,
       maxSupply: 43500000,
       ath: 0.30,
       athChangePercentage: 0,
       athDate: "2023-05-13T20:49:26.606Z",
       atl: 0.102,
       atlChangePercentage: 300,
       atlDate: "2022-07-06T00:00:00.000Z",
       lastUpdated: "2023-03-13T23:18:10.268Z",
       sparklineIn7D: SparklineIn7D(price: [
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.201,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3,
        0.3
       ]),
       priceChangePercentage24HInCurrency: 0,
       currentHoldings: 0)
}

