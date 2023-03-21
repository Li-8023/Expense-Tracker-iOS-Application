//
//  DetailView.swift
//  Bookkeeping
//
//  Created by 贺力 on 3/19/23.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var body: some View{
        Text("Detail view here")
        NavigationLink(destination: SucessView())
        {
            Text("Sumbit")
        }
    }
}
