//
//  CoinDetails.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/26/21.
//

import Foundation

// API Data

/*
 API REQUEST URL
 https://api.coingecko.com/api/v3/coins/bitcoin?tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false
 
*/

struct CoinDetails: Codable {
    let id, symbol, name: String

    enum CodingKeys: String, CodingKey {
        case id, symbol, name
    }
}
