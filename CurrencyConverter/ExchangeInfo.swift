//
//  ExchangeInfo.swift
//  CurrencyConverter
//
//  Created by RhezaWidhiarto on 07/10/25.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var exchangeRates: [ExchangeRateData] = [
        ExchangeRateData(leftImage: .goldpiece, exchangeRateTxt: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny),
        ExchangeRateData(leftImage: .goldpenny, exchangeRateTxt: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece),
        ExchangeRateData(leftImage: .silverpiece, exchangeRateTxt: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny),
        ExchangeRateData(leftImage: .silverpenny, exchangeRateTxt: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
    ]
    
    var body: some View {
        ZStack {
            //Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            //Section
            VStack {
                //Title Exchange Rates
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                //Exchange Description
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                
                //Exchange Rates
                ForEach(0..<4) { i in
                    ExchangeRate(exchangeRateData: exchangeRates[i])
                }
                
                //Done Button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.4))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
