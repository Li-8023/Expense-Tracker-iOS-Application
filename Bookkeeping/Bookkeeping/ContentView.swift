//
//  ContentView.swift
//  Bookkeeping
//
//  Created by 贺力 on 3/15/23.
//

import SwiftUI

struct ContentView: View {
        var body: some View {
            NavigationView{
                VStack {
                    Text("Record Now!!!")
                        .font(.system(size:36))
                        .foregroundColor(Color("Color_background"))
                    Image("online_bank")
                        .resizable()
                        .scaledToFit()
                    
                    HStack{
                        NavigationLink(destination: FindMarketView())
                        {
                            Text("Find Market")
                                .font(.system(size:20))
                                .foregroundColor(Color("Color_text"))
                        }.padding()
                            .background(Color("Color_background"))
                            .clipShape(Capsule())
                        
                        NavigationLink(destination: CurrencyRateView())
                        {
                            Text("Currency Rate")
                                .font(.system(size:20))
                                .foregroundColor(Color("Color_text"))
                        }.padding()
                            .background(Color("Color_background"))
                            .clipShape(Capsule())
                    }
                    .padding()
                    NavigationLink(destination: RecordItemView())
                    {
                        Text("Record Now")
                            .font(.system(size:20))
                            .foregroundColor(Color("Color_text"))
                    }.padding()
                        .background(Color("Color_background"))
                        .clipShape(Capsule())
                }
                .padding()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
