//
//  CoinDetailsViewModel.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/26/21.
//

import Foundation
import Combine

class CoinDetailsViewModel: ObservableObject {
    
    @Published var overviewStats = [StatisticModel]()
    @Published var additionalStats = [StatisticModel]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var coin: Coin
    let service: CoinDetailService
    
    init(coin: Coin) {
        self.coin = coin
        self.service = CoinDetailService(coin: coin)
        
        addSubscribers()
    }
    
    private func addSubscribers() {
        service.$coinDetails
            .combineLatest($coin)
            .map(mapData)
            .sink { [weak self] details in
                self?.overviewStats = details.overview
                self?.additionalStats = details.additional
            }
            .store(in: &cancellables)
    }
    
    private func mapData(details: CoinDetails?, coin: Coin) -> (overview: [StatisticModel], additional: [StatisticModel]) {
        let overview = self.overviewStats(coin: coin, details: details)
        let additional = self.additionalStats(coin: coin, details: details)
        
        return (overview, additional)
    }
    
    private func overviewStats(coin: Coin, details: CoinDetails?) -> [StatisticModel] {
        let price = coin.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coin.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Aktueller Kurs", value: price, percentageChange: pricePercentChange)
        
        let marketCap = coin.marketCap?.formattedWithAbbreviations() ?? ""
        let marketCapPercentChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Marktkapitalisierung", value: marketCap, percentageChange: marketCapPercentChange)
        
        let rank = "\(coin.rank)"
        let rankStat = StatisticModel(title: "Rang", value: rank)
        
        let volume = "$" + (coin.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatisticModel(title: "Handelsvolumen", value: volume)

        return [priceStat, marketCapStat, rankStat, volumeStat]
    }
    
     func overviewuserdata() -> [StatisticModel]{
        let currentholding = StatisticModel(title: "derzeitige Anlagen", value: "0.0")
        
        let currentvalue = StatisticModel(title: "derzeitiger Wert", value: "0.0")
        
        let currentvaluechange = StatisticModel(title: "Änderungen innerhalb 24h", value: "0.0%")
        
        let currentchangetotal = StatisticModel(title: "Gesamtänderung", value: "0.0%")
        
        return [currentholding, currentvalue, currentvaluechange, currentchangetotal]
    }
    
    private func additionalStats(coin: Coin, details: CoinDetails?) -> [StatisticModel] {
        let high = coin.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = StatisticModel(title: "24H Hoch", value: high)
        
        let low = coin.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = StatisticModel(title: "24H Tief", value: low)
        
        let priceChange = coin.priceChange24H.asCurrencyWith6Decimals()
        let pricePercentChange2 = coin.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24H Veränderung", value: priceChange, percentageChange: pricePercentChange2)
        
        let marketCapChange = "$" + (coin.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange2 = coin.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24H Veränderung Marktkapitalisierung", value: marketCapChange, percentageChange: marketCapPercentChange2)
        
        return [highStat, lowStat, priceChangeStat, marketCapChangeStat]
    }
}
