//
//  EchangeRate.swift
//  CurrencyConverter
//
//  Created by RhezaWidhiarto on 07/10/25.
//

import SwiftUI

struct ExchangeRate: View {
//    var leftImage: ImageResource = .silverpiece
//    var exchangeText: String = "1 Silver Piece = 4 Silver Pennies"
//    var rightImage: ImageResource = .silverpenny
    
    var exchangeRateData: ExchangeRateData?
    
    var body: some View {
        HStack {
            //Left currency image
            Image(exchangeRateData?.leftImage ?? .silverpiece)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            //Exchange rate text
            Text(exchangeRateData?.exchangeRateTxt ?? "1 Silver Piece = 4 Silver Pennies")
            
            //Right currency image
            Image(exchangeRateData?.rightImage ?? .silverpenny)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRateData {
    var leftImage: ImageResource
    var exchangeRateTxt: String
    var rightImage: ImageResource
}

#Preview {
    ExchangeRate()
}
