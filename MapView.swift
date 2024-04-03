//
//  MapView.swift
//  coffeeApp
//
//  Created by Rodrigo Cisternas on 09-10-22.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
let id = UUID()
let name: String
let latitude: Double
let longitude: Double
var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

struct MapView : View{
    @State private var mapRegion = MKCoordinateRegion(center:
                                    CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span:
                                    MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    let places = [
        Place(name: "Position 1", latitude: 51.501, longitude:  -0.141),
        Place(name: "Position 2", latitude: 51.508, longitude:  -0.76),
        Place(name: "Position 3", latitude: 51.511, longitude:  -0.11)
    ]
    
   /* let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    */
    
    var body: some View{
        ZStack{
            
            Map(coordinateRegion: $mapRegion, showsUserLocation: false,  annotationItems: places){ place in
            MapPin(coordinate: place.coordinate,tint: Color.red)
           // MapMarker(coordinate: place.coordinate)
                
            }
            Text("Aqui")
        }
    }
}
