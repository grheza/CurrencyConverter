//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by RhezaWidhiarto on 04/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    var body: some View {
        ZStack {
            //Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            //Currency Section
            VStack {
                //Pony Currency Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //Currency Exchange Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                //Convertion Section
                HStack {
                    //Left Convertion Section
                    VStack {
                        //Currenccy
                        HStack {
                            //Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        //TextField
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount) {
                                if leftTyping {
                                    rightAmount = leftCurrency.convert(to: rightCurrency, leftAmount)
                                }
                            }
                    }
                    
                    //Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //Right Convertion Section
                    VStack {
                        //Currenccy
                        HStack {
                            //Currency Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        //TextField
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .onChange(of: rightAmount) {
                                if rightTyping {
                                    leftAmount = rightCurrency.convert(to: leftCurrency, rightAmount)
                                }
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    //Info Button
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
//            .border(.blue)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(fromCurrency: $leftCurrency, toCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
