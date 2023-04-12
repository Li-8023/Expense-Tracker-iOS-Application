//
//  SuccessView.swift
//  Bookkeeping(CoreData)
//
//  Created by 贺力 on 3/21/23.
//

import Foundation
import SwiftUI

struct SuccessView: View{
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

struct SuccessView_Previews: PreviewProvider{
    static var previews: some View{
        SuccessView()
    }
}
