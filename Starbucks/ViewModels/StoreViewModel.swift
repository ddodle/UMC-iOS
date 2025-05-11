//
//  StoreViewModel.swift
//  Starbucks
//
//  Created by 김도연 on 5/6/25.
//

import SwiftUI
import CoreLocation

class StoreViewModel: ObservableObject {
    @Published var stores: [Store] = []
    
    init() {
        loadGeoJSON()
    }
    
    private func loadGeoJSON() {
        guard let url = Bundle.main.url(forResource: "starbucks_2025_data",
                                        withExtension: "geojson") else {
            print("⚠️ GeoJSON 파일을 찾을 수 없습니다.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let geo = try JSONDecoder().decode(GeoJSON.self, from: data)
            stores = geo.features.map { feature in
                let p = feature.properties
                return Store(
                    name: p.Sotre_nm,
                    address: p.Address,
                    category: p.Category,
                    coordinate: CLLocationCoordinate2D(
                        latitude: p.Ycoordinate,
                        longitude: p.Xcoordinate
                    )
                )
            }
        } catch {
            print("⚠️ GeoJSON 파싱 오류:", error)
        }
    }
}
