//
//  DetailView.swift
//  Bookkeeping(CoreData)
//
//  Created by 贺力 on 3/21/23.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @State var resultImage = ""
    var body: some View{
        VStack{
            Text("Detail view here")
            //        NavigationLink(destination: SucessView())
            //        {
            //            Text("Sumbit")
            //        }
            Button("Submit", action: {
                resultImage = "success"
            })
            Image(resultImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Success")
                .foregroundColor(Color("sucess"))
                .font(.system(size:36))
        }
    }
}

