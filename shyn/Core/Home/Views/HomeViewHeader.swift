//
//  HomeViewHeader.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/23/21.
//

import SwiftUI

struct HomeViewHeader: View {
    @Binding var showSettings: Bool
    
    var body: some View {
        HStack {
            CircleButtonView(imageName: "person")
                .onTapGesture {
                    showSettings.toggle()
                }
            
            Spacer()
            
            Text("Dein Portfolio")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            
            Spacer()
            
            CircleButtonView(imageName: "moon")
//                .rotationEffect(.degrees(showPortfolio ? 180 : 0))
                .onTapGesture {
//                    withAnimation(.spring()) {
//                        showPortfolio.toggle()
//                    }
                }
        }
        .padding(.horizontal)
    }
}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewHeader(showSettings: .constant(false))
    }
}
