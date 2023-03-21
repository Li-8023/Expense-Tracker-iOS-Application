//
//  FindMarketView.swift
//  Bookkeeping
//
//  Created by 贺力 on 3/15/23.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

struct Location: Identifiable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
struct FindMarketView: View{
    @State var enterAddress: String = ""
    
    
    @State private static var defaultLocation = CLLocationCoordinate2D(
        latitude: 33.42555,
        longitude: -111.9400
    )
    @State private var region = MKCoordinateRegion(
        center: defaultLocation,
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    @State private var markers = [
        Location(name: "Tempe", coordinate: defaultLocation)
    ]
    
    @State private var searchText = ""
    var body: some View{
        VStack{
            HStack{
                Text("Address: ")
                    .foregroundColor(Color("Color_background"))
                TextField("e.g. New York, NY", text: $enterAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            Button{
                forwardGeocoding(address: enterAddress)
            }label: {
                Text("Submit")
                    .foregroundColor(Color("Color_background"))
            }
            Map(coordinateRegion: $region,
                interactionModes: .all,
                annotationItems: markers
            ){ location in
                MapMarker(coordinate: location.coordinate)
            }
            .ignoresSafeArea()
            
            Spacer()
            searchBar
        }
        
        
    }
    private var searchBar: some View {
        HStack {
            Button {
                let searchRequest = MKLocalSearch.Request()
                searchRequest.naturalLanguageQuery = searchText
                searchRequest.region = region
                
                MKLocalSearch(request: searchRequest).start { response, error in
                    guard let response = response else {
                        print("Error: \(error?.localizedDescription ?? "Unknown error").")
                        return
                    }
                    region = response.boundingRegion
                    markers = response.mapItems.map { item in
                        Location(
                            
                            name: item.name ?? "",
                            coordinate: item.placemark.coordinate
                        )
                    }
                }
            } label: {
                Image(systemName: "location.magnifyingglass")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 12)
            }
            TextField("Search e.g. Market", text: $searchText)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
        }
        .padding()
    }
    
    func forwardGeocoding(address: String)
    {
        let geoCoder = CLGeocoder();
        let addressString = address
        CLGeocoder().geocodeAddressString(addressString, completionHandler:
                                            {(placemarks, error) in
            
            if error != nil {
                print("Geocode failed: \(error!.localizedDescription)")
            }
            else if placemarks!.count > 0
            {
                let placemark = placemarks![0]
                let location = placemark.location
                let coords = location!.coordinate
                print("latitude: \(coords.latitude)" )
                print(coords.longitude)
                
                    DispatchQueue.main.async
                    {
                        region.center = coords
                        markers[0].name = placemark.locality!
                        markers[0].coordinate = coords
                    }

            }
        })
    }
}


struct FindMarketView_Previews: PreviewProvider{
    static var previews: some View{
        FindMarketView()
    }
}
