//
//  HomeViewModel.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/23/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins = [Coin]()
    @Published var searchText = ""
    @Published var isLoading = true
    
    private let service = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    private var inSearchMode: Bool {
        return !searchText.isEmpty || searchText != ""
    }
    
    @Published var topMovingCoins = [Coin]()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(service.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] coins in
                guard let self = self else { return }
                self.allCoins = coins
                self.fetchUserPortfolioAndUpdateHoldings()
                self.isLoading = false
                
                if !self.inSearchMode {
                    let topMovers = self.allCoins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
                    self.topMovingCoins = Array(topMovers.prefix(5));
                }
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else { return coins }
        
        let lowercased = text.lowercased()
        
        return coins.filter({
            $0.name.lowercased().contains(lowercased) ||
            $0.symbol.contains(lowercased)
        })
    }
    
    private func fetchUserPortfolioAndUpdateHoldings() {
        if let portfolio = AuthViewModel.shared.user?.portfolio {
            updateHoldingCoins(inPortfolio: portfolio)
        } else {
            PortfolioService.fetchUserPortfolio { portfolio in
                AuthViewModel.shared.user?.portfolio = portfolio
                self.updateHoldingCoins(inPortfolio: portfolio)
            }
        }
    }
    
    private func updateHoldingCoins(inPortfolio portfolio: Portfolio) {
        for i in 0 ..< portfolio.holdings.count {
            let holding = portfolio.holdings[i]
            let coin = self.allCoins.first(where: { $0.id == holding.coinID })
            
            AuthViewModel.shared.user?.portfolio?.holdings[i].coin = coin
        }
    }
}
