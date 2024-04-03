//
//  LocationViewModel.swift
//  coffeeApp
//
//  Created by Rodrigo Cisternas on 17-10-22.
//

import Foundation
import CoreLocation
import MapKit

final class LocationViewModel : NSObject, ObservableObject{
    
    private struct DefaultRegion {
        static let latitude = -33.43107
        static let longitude = -70.60454
    }
    private struct Span {
        static let delta = 0.1
    }
    
    @Published var userLocation : MKCoordinateRegion = .init()
    private let locationManager: CLLocationManager = .init()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        userLocation = .init(center: .init(latitude: DefaultRegion.latitude, longitude: DefaultRegion.longitude), span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
        
    }
    
}

extension LocationViewModel : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        print(" location \(location)")
        userLocation = .init(center: location.coordinate, span : .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    }
}
