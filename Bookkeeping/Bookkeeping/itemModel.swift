//
//  itemModel.swift
//  Bookkeeping
//
//  Created by 贺力 on 3/19/23.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()
    var name = String()
    var price = Double()
    var store = String()
}

public class itemModel: ObservableObject {
    @Published var data = [Item(name:"Napkins", price: 4.50, store: "Walmart"),
                           Item(name:"Napkins", price: 4.50, store: "Walmart"),
                           Item(name:"Napkins", price: 4.50, store: "Walmart"),
                           Item(name:"Napkins", price: 4.50, store: "Walmart"),
                           Item(name:"Napkins", price: 4.50, store: "Walmart"),
                            ]
    
    var count: Int {
        data.count
    }
    
    func getItem(at index: Int) -> Item {
        return data[index]
    }
    
    func add(item: Item)
    {
        data.append(item)
    }
    
    func removeItem(at index: Int)
    {
        data.remove(at: index)
    }
    
    func findItem(item: String) -> Int {
        var loc:Int = 0
        for c in data{
            if c.name == item{
                break;
            }
            
            loc = loc + 1
            
        }
        return loc
    }
}
