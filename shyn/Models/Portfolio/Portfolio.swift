//
//  Portfolio.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 1/21/22.
//

import Foundation

struct Portfolio: Decodable {
    var holdings: [Holding]
    
    var cashValue: Double {
        guard let cashHolding = holdings.first(where: { $0.coinID == "eur" }) else { return 0 }
        return cashHolding.amount
    }
    
    var investmentsValue: Double {
        return holdings.filter({ $0.coinID != "eur" })
            .map({ $0.dollarAmount })
            .reduce(0, +)
    }
    
    var netValue: Double {
        return investmentsValue + cashValue
    }
    
    var netProfitLoss: Double {
        var amountInvestedSum = 0.0
        
        holdings.forEach { holding in
            let averageCost = holding.averageCost
            let dollarAmountInvested = averageCost * holding.amount
            amountInvestedSum += dollarAmountInvested
        }

        let netProfitLoss = investmentsValue / amountInvestedSum - 1
        
        return netProfitLoss * 100
    }
    
    var netProfitLoss24H: Double {
        var percentageChangeSum = 0.0
        holdings.forEach { holding in
            guard let coin = holding.coin else { return }
            
            let priceChangePercentage24H = coin.priceChangePercentage24H / 100
            let holdingPercentageOfPortfolio = holding.percentageOfPortfolio(portfolioNetValue: netValue)
            let holdingDelta = priceChangePercentage24H * holdingPercentageOfPortfolio
            
            percentageChangeSum += holdingDelta
        }
        
        return percentageChangeSum
    }
}
