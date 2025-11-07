//
//  SelectCurrency.swift
//  CurrencyConverter
//
//  Created by RhezaWidhiarto on 07/10/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var fromCurrency: Currency
    @Binding var toCurrency: Currency
    
    var body: some View {
        ZStack {
            //Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                //Currency Icon
                IconGrid(currency: $fromCurrency)
                
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                //CurrencyIcon
                IconGrid(currency: $toCurrency)
                
                //Button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.4))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var fromCurrency: Currency = .silverPenny
    @Previewable @State var toCurrency: Currency = .goldPenny
    
    SelectCurrency(fromCurrency: $fromCurrency, toCurrency: $toCurrency)
}
