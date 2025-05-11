//
//  geoJSON.swift
//  Starbucks
//
//  Created by 김도연 on 5/6/25.
//

import Foundation
import CoreLocation


struct GeoJSON: Codable {
    let features: [Feature]
}

struct Feature: Codable {
    let properties: Properties
    let geometry: Geometry
}

struct Properties: Codable {
    let Seq: String
    let Sotre_nm: String
    let Address: String
    let Telephone: String
    let Category: String?
    let Ycoordinate: Double
    let Xcoordinate: Double
}

struct Geometry: Codable {
    let coordinates: [Double]
}

struct Store: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let category: String?
    let coordinate: CLLocationCoordinate2D
}
