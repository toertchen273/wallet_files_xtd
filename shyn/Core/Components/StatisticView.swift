//
//  StatisticView.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/26/21.
//

import SwiftUI

struct StatisticView: View {
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            if let change = stat.percentageChange {
                HStack(spacing: 4) {
                    Image(systemName: "triangle.fill")
                        .font(.caption)
                        .rotationEffect(Angle(degrees: change >= 0 ? 0 : 180))
                    
                    Text(change.asPercentString())
                        .font(.caption)
                        .bold()
                }
                .foregroundColor(change >= 0 ? Color.theme.green : Color.theme.red)
            }
        }
        .padding(6)
        .frame(height: 64)
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(stat: dev.stat1)
                .previewLayout(.sizeThatFits)
            
            StatisticView(stat: dev.stat3)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
