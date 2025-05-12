//
//  NavigationMapView.swift
//  Starbucks
//
//  Created by 김도연 on 5/12/25.
//

import SwiftUI
import MapKit

struct NavigationMapView: View {
    enum MenuTab: Int, CaseIterable {
        case store, road
        var title: String {
            switch self {
            case .store:  return "매장 찾기"
            case .road: return "길 찾기"
            }
        }
    }
    
    @StateObject private var vm = StoreViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var cameraPosition: MapCameraPosition =
        .userLocation(
            followsHeading: false,
            fallback: .region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: 37.484768,
                        longitude: 126.930467
                    ),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.01,
                        longitudeDelta: 0.01
                    )
                )
            )
        )
    @StateObject private var locMgr = LocationManager()
    @State private var selected = MenuTab.store

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                topBar
                
                mapView
            }
            .navigationBarHidden(true)
        }
    }

    var topBar: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("매장 찾기")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading){
                        Button{
                            dismiss()
                        } label:{
                            Image("back1")
                        }
                        .padding()
                    }
            }
            .padding(.vertical)
            
            HStack{
                HStack(spacing: 0){
                    ForEach(MenuTab.allCases, id: \.self) { tab in
                        Button {
                            withAnimation(.easeInOut) { selected = tab }
                        } label: {
                            VStack(spacing: 12) {
                                Text(tab.title)
                                    .font(.headline)
                                    .foregroundColor(selected == tab ? .black : .gray)
                                Rectangle()
                                    .fill(selected == tab ? .brown : .clear)
                                    .frame(height: 3)
                                    .frame(minWidth: 80)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                }
            }
            .overlay(
                Divider()
                    .frame(height: 3)
                    .background(Color.gray.opacity(0.1))
                    .shadow(color: Color.black.opacity(0.8),
                        radius: 4,
                        x: 0,
                        y: 2),
                alignment: .bottom
            )
        }
    }
    
    @ViewBuilder
    var mapView: some View{
        if selected == MenuTab.store{
            ZStack {
                Map(position: $cameraPosition) {
                    ForEach(nearbyStores) { store in
                        Marker(store.name, coordinate: store.coordinate)
                            .tint(.green)
                    }
                    UserAnnotation()
                }
                .edgesIgnoringSafeArea(.bottom)
                
                VStack{
                    Button(action: {
                        print("이 지역 검색 ㅠㅠ")
                    }, label: {
                      Text("이 지역 검색")
                            .font(.caption)
                            .foregroundStyle(.black)
                    })
                    .frame(width: 88,height: 36)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(.white)
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            if let coord = locMgr.lastLocation?.coordinate {
                                withAnimation {
                                    cameraPosition = .region(
                                        MKCoordinateRegion(
                                            center: coord,
                                            span: MKCoordinateSpan(
                                                latitudeDelta: 0.01,
                                                longitudeDelta: 0.01
                                            )
                                        )
                                    )
                                }
                            }
                        }) {
                            Image(systemName: "location.fill")
                                .font(.title2)
                                .padding(8)
                                .background(.white)
                                .clipShape(Circle())
                        }
                        .padding()
                    }
                }
            }
        } else{
            Color.black
        }
    }
    
    private var nearbyStores: [Store] {
        guard let userLoc = locMgr.lastLocation else {
            return []
        }
        return vm.stores.filter { store in
            let storeLoc = CLLocation(
                latitude: store.coordinate.latitude,
                longitude: store.coordinate.longitude
            )
            return userLoc.distance(from: storeLoc) <= 10_000
        }
    }
}

#Preview {
    NavigationMapView()
}
