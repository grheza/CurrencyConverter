//
//  IconGrid.swift
//  CurrencyConverter
//
//  Created by RhezaWidhiarto on 07/10/25.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                let item = CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                if self.currency == currency {
                    item.shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    item.onTapGesture {
                        self.currency = currency
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currency: Currency = .silverPiece
    
    IconGrid(currency: $currency)
}
