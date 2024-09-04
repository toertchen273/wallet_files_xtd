//
//  PortfolioViewModel.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/28/21.
//

import Firebase
import FirebaseFirestoreSwift

import SwiftUI

class TransactionViewModel: ObservableObject {
    @Published var transactions = [Transaction]()
    private let coinID: String
    
    init(coinID: String) {
        self.coinID = coinID
    }
}
