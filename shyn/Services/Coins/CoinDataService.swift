//
//  CoinDataService.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/23/21.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins = [Coin]()
    let shincoin = Coin(
       id: "shiny",
       symbol: "shyn",
       name: "SHINY",
       image: "https://shinygermany.io/images/logos/shyntoken.svg",
       currentPrice: 0.30,
       marketCap: 103043590000,
       marketCapRank: 51,
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
    
    var timer: Timer?
    var coinSubscription: AnyCancellable?
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=true&price_change_percentage=24h"
    
    init() {
        fetchCoinsAndStartTimer()
    }
    
    func fetchCoinsAndStartTimer() {
        fetchCoins()
        refreshData()
    }
    
    private func fetchCoins() {
        NetworkManager.download(withUrlString: urlString) { data, error in
            guard let data = data else { return }
            
            do {
                var coins = try JSONDecoder().decode([Coin].self, from: data)
                self.allCoins = coins
                self.allCoins.insert(self.shincoin, at: 0)
            } catch let error {
                print("DEBUG: Error \(error.localizedDescription)")
            }
        }
    }
    
    private func refreshData() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 120.0, repeats: true) { _ in
            self.fetchCoins()
        }
    }
    
    //    private func fetchCoins() {
    //        guard let url = URL(string: urlString) else { return }
    //
    //        coinSubscription = NetworkManager.download(url: url)
    //            .decode(type: [Coin].self, decoder: JSONDecoder())
    //            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] coins in
    //                self?.allCoins = coins
    //                self?.coinSubscription?.cancel()
    //            })
    //    }
}
