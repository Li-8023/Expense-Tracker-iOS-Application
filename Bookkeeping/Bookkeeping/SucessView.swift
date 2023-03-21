//
//  SucessView.swift
//  Bookkeeping
//
//  Created by 贺力 on 3/15/23.
//

import Foundation
import SwiftUI

struct SucessView: View{
    var body: some View{
        VStack{
            Image("success")
                .resizable()
                .scaledToFit()
            Text("Sucess")
                .foregroundColor(Color("Color_sucess"))
                .font(.system(size:36))
            NavigationLink(destination: ContentView())
            {
                Text("Go back to the main page")
                    .foregroundColor(Color("Color_sucess"))
            }
           
            
        }
    }
}

struct SucessView_Previews: PreviewProvider{
    static var previews: some View{
        SucessView()
    }
}
