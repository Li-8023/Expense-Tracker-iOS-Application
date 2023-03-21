//
//  CurrencyRateView.swift
//  Bookkeeping
//
//  Created by 贺力 on 3/15/23.
//

import Foundation
import SwiftUI

struct CurrencyRateView: View{
    var body: some View{
        VStack{
            Image("transfer")
                .resizable()
                .scaledToFit()
                .padding()
            Text("currency rate view here")
        }
    }
}

struct CurrencyRateView_Previews: PreviewProvider{
    static var previews: some View{
        CurrencyRateView()
    }
}
