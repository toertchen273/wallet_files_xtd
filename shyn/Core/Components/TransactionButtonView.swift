//
//  TransactionButtonView.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/28/21.
//

import SwiftUI

struct TransactionButtonView: View {
    @Binding var showNewTransactionView: Bool
    
    var body: some View {
        HStack {
            Button {
                showNewTransactionView.toggle()
            } label: {
                Text("Senden")
                    .font(.headline).bold()
                    .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 44)
                    .background(Color(.systemRed))
                    .cornerRadius(8)
            }
            
            Spacer()
            
            Button {
                showNewTransactionView.toggle()
            } label: {
                Text("Empfangen")
                    .font(.headline).bold()
                    .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 44)
                    .background(Color(.systemGreen))
                    .cornerRadius(8)
            }
        }
        .foregroundColor(.white)
    }
}

struct TransactionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionButtonView(showNewTransactionView: .constant(false))
                .previewLayout(.sizeThatFits)
                .padding()
            
            TransactionButtonView(showNewTransactionView: .constant(false))
                .previewLayout(.sizeThatFits)
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}
