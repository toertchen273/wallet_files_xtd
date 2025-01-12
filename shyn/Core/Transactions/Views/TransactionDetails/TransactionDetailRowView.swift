//
//  TransactionDetailRowView.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/28/21.
//

import SwiftUI

struct TransactionDetailRowView: View {
    let viewModel: TransactionDetailViewModel
    let detail: String
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.title)
                    .foregroundColor(Color.theme.secondaryText)
                
                Spacer()
                
                Text(detail)
            }
            .font(.subheadline)
            
            Divider()
        }
    }
}

struct TransactionDetailRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailRowView(viewModel: .price, detail: "$1.49")
    }
}
