//
//  RecordItemView.swift
//  Bookkeeping
//
//  Created by 贺力 on 3/15/23.
//

import Foundation
import SwiftUI

struct RecordItemView: View{
    
    @StateObject var items = itemModel()
    
    var body: some View{
        NavigationView {
            List {
                ForEach (items.data, id: \.id) {
                    item in NavigationLink(destination: DetailView())
                    {
                        HStack
                        {
                            Text(item.name)
                            Text(item.store)
                            Text(String(item.price))
                        }
                    }
                }.onDelete(perform: {IndexSet in
                    items.data.remove(atOffsets: IndexSet)
                })
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("List Item")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let i:Item = Item(name: "Paper", price: 3.45, store: "Fry's")
                        items.add(item: i)
                    }label : {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct RecordItemView_Previews: PreviewProvider{
    static var previews: some View{
        RecordItemView()
    }
}
