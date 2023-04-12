//
//  CurrencyRateView.swift
//  Bookkeeping(CoreData)
//
//  Created by 贺力 on 3/21/23.
//

import Foundation
import SwiftUI

//url: https://api.freecurrencyapi.com/v1/latest?apikey=KbaTWbW4iPbZaGai9pf7TaQ9KeV5jo7NLP7KS0KV&currencies=USD&base_currency=BRL

struct Currency: Decodable
{
    let data:Data
}
struct Data: Decodable
{
    let USD: Double?
}
struct CurrencyRateView: View{
    
    @State var enteredText = ""
    @State var result = ""
    @State var USDNum = "1"
    @State var USDtext = "USD"
    @State var choiceMade = ""
    
    let currency = ["AUD", "BGN", "BRL", "CAD", "CHF",
                    "CNY", "CZK", "DKK", "EUR", "GBP", "HKD",
                    "HRK", "HUF", "IDR", "ILS", "INR", "ISK",
                    "JPY","KRW", "MXN", "MYR", "NOK", "NZD",
                    "PHP", "PLN", "RON", "RUB", "SEK", "SGD",
                    "THB", "TRY", "USD", "ZAR"]
    var body: some View{
        VStack(spacing:150){
            VStack(spacing: 10)
            {
                Text("Check Currency Rate")
                    .foregroundColor(Color("Color_background"))
                    .font(.system(size:30))
                Image("transfer")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            
            VStack(spacing: 20)
            {
                HStack
                {
                    Menu
                    {
                        ScrollView{
                            
                            ForEach(currency, id: \.self) {item in
                                Button(action: {
                                    choiceMade = item
                                }){
                                    Text(item)
                                }
                            }
                            
                        }
                    }label: {
                        Text("Choice currency")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color_border"))
                    }
                    
                    Button{
                        getJsonData()
                    }label: {
                        Image(systemName: "dollarsign.arrow.circlepath")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 12)
                            .foregroundColor(.pink)
                    }
                }
                HStack
                {
                    Text("1")
                        .foregroundColor(Color("Color_border"))
                    
                    Text("USD")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color_border"))
                    Text("=")
                        .foregroundColor(Color("Color_border"))
                    Text(result)
                        .foregroundColor(Color("Color_background"))
                    Text(choiceMade)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color_background"))
                    
                }
            }
        }
    }
    
    func getJsonData()
    {
        let urlAsString="https://api.freecurrencyapi.com/v1/latest?apikey=KbaTWbW4iPbZaGai9pf7TaQ9KeV5jo7NLP7KS0KV&currencies=USD&base_currency="+choiceMade
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if(error != nil)
            {
                print(error!.localizedDescription)
            }
            
            do
            {
                let decodedData = try JSONDecoder().decode(Currency.self, from: data!)
                result = String(decodedData.data.USD ?? 0.0)
                
            }catch {
                print("error: \(error)")
            }
            
        })
        jsonQuery.resume()
        
    }
}

struct CurrencyRateView_Previews: PreviewProvider{
    static var previews: some View{
        CurrencyRateView()
    }
}
