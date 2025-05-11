//
//  LocationManager.swift
//  Starbucks
//
//  Created by 김도연 on 5/6/25.
//

import SwiftUI
import CoreLocation

final class LocationManager: NSObject, ObservableObject {
    @Published var lastLocation: CLLocation?
    
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        lastLocation = locations.last
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("Location error: \(error)")
    }
}
