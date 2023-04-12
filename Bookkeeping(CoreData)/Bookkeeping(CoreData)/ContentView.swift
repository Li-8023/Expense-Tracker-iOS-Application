//
//  ContentView.swift
//  Bookkeeping(CoreData)
//
//  Created by 贺力 on 3/21/23.
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
                            VStack
                            {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(Color("Color_text"))
                                Text("Find Market")
                                    .font(.system(size:20))
                                    .foregroundColor(Color("Color_text"))
                            }
                        }.padding()
                            .background(Color("Color_background"))
                            .clipShape(Capsule())
                        
                        NavigationLink(destination: CurrencyRateView())
                        {
                            VStack{
                                Image(systemName: "dollarsign")
                                    .foregroundColor(Color("Color_text"))
                                Text("Currency Rate")
                                    .font(.system(size:20))
                                    .foregroundColor(Color("Color_text"))
                            }
                        }.padding()
                            .background(Color("Color_background"))
                            .clipShape(Capsule())
                    }
                    .padding()
                    NavigationLink(destination: RecordItemView())
                    {
                        VStack{
                            Image(systemName: "pencil.line")
                                .foregroundColor(Color("Color_text"))
                            Text("Record Now")
                                .font(.system(size:20))
                                .foregroundColor(Color("Color_text"))
                        }
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

