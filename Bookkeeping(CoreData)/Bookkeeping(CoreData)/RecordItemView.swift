//
//  RecordView.swift
//  Bookkeeping(CoreData)
//
//  Created by 贺力 on 3/21/23.
//


import SwiftUI
import CoreData

struct RecordItemView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Product>
    
    @State var toInsertView = false
    
    //Text field inputs
    @State var newItemName = ""
    @State var newItemPrice = ""
    @State var newItemStore = ""

    var body: some View {
        //NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        VStack{
                            Text("Added Item")
                                .foregroundColor(Color("Color_background"))
                                .font(.system(size: 30))
                            Image("add_to_cart")
                                .resizable()
                                .scaledToFit()
                            VStack(spacing: 10)
                            {
                                HStack
                                {
                                    Text("Name: ")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("Color_border"))
                                        .font(.system(size: 20))
                                    Text(item.name!)
                                        .foregroundColor(Color("Color_background"))
                                        .font(.system(size: 20))
                                        .padding(4.0)
                                    
                                }.padding()
                                HStack{
                                    Text("Price: ")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("Color_border"))
                                        .font(.system(size: 20))
                                    Text(Decimal(item.price), format: .currency(code: "USD"))
                                        .foregroundColor(Color("Color_background"))
                                        .font(.system(size: 20))
                                        .padding(4.0)
                                    
                                }.padding()
                                HStack{
                                    Text("Store: ")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("Color_border"))
                                        .font(.system(size: 20))
                                    Text(item.store!)
                                        .foregroundColor(Color("Color_background"))
                                        .font(.system(size: 20))
                                        .padding(4.0)
                                    
                                }.padding()
                            }
                        }
                        
                    } label: {
                        
                        HStack{
                            
                            Text(item.name!)
                                .foregroundColor(Color("Color_background"))
                            Spacer()
                            Text(Decimal(item.price), format: .currency(code: "USD"))
                                .foregroundColor(Color("Color_border"))
                            Spacer()
                            Text(item.store!)
                                .foregroundColor(Color("Color2"))
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    //Button(action: addItem) {
                    Button{
                        toInsertView = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }.alert("Insert", isPresented: $toInsertView, actions: {
                TextField("Name:", text: $newItemName)
                TextField("Price:", text: $newItemPrice)
                TextField("Store:", text: $newItemStore)
                
                Button("Insert", action: {
                    addItem(n: newItemName, p: Double(newItemPrice) ?? 0.0, s: newItemStore)
                    toInsertView = false
                })
                
                Button("Cancel", role: .cancel, action: {
                    toInsertView = false
                })
                
            }, message: {
                Text("Please Enter Product Information to Store")
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color("Color_border"))
            })
        Text("Name       Price        Store")
            .fontWeight(.bold)
            .foregroundColor(Color("Color_border"))
        
    }

    private func addItem(n: String, p: Double, s: String) {
        withAnimation {
            let newItem = Product(context: viewContext)
            newItem.name = n
            newItem.price = p
            newItem.store = s

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct RecordItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecordItemView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

