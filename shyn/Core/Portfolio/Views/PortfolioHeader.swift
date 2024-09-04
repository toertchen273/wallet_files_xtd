//
//  PortfolioHeader.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/26/21.
//

import SwiftUI

struct PortfolioHeader: View {
    var animation: Namespace.ID
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))], startPoint: .center, endPoint: .bottomTrailing)
            
            VStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Mein Portfolio")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
//                        Image(systemName: "arrow.right")
                    }
                    
                    if let portfolio = viewModel.user?.portfolio {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(portfolio.netValue.asCurrencyWith2Decimals())
                                    .font(.title2).bold()
                                    .opacity(0.95)
                                
                                Text("Dein momentanes Vermögen")
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 4) {
                                Text((portfolio.netProfitLoss24H >= 0 ? "+" : "") + portfolio.netProfitLoss24H.asPercentString())
                                    .font(.title3)
                                    .bold()
                                
                                Text("Today")
                                    .font(.caption)
                            }
                        }
                        .padding(.top, 8)
                    } else {
                        Text("Empfange Assets um dir dein Portfolio anzeigen lassen zu können.")
                            .font(.title3)
                            .fontWeight(.light)
                            .opacity(0.95)
                            Spacer()
                        Text("Momentan verfügst du über keine Assets.")
                            .font(.title3)
                            .fontWeight(.light)
                            .opacity(0.95)
                    }
                }
                .foregroundColor(.white)
                .padding()
                
                Spacer()
            }
        }
        .cornerRadius(10)
        .shadow(color: Color.theme.accent.opacity(0.25), radius: 12, x: 0, y: 0)
    }
}

//struct PortfolioHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        PortfolioHeader()
//    }
//}
