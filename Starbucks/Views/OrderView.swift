//
//  OrderView.swift
//  Starbucks
//
//  Created by 김도연 on 5/6/25.
//

import SwiftUI
import MapKit

struct OrderView: View {
    
    enum MenuTab: Int, CaseIterable {
        case all, mine
        var title: String {
            switch self {
            case .all:  return "전체 메뉴"
            case .mine: return "나만의 메뉴"
            }
        }
    }
    
    @StateObject private var vm = StoreViewModel()
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
    @State private var selected = MenuTab.all
    @State private var selectedTab1 = 0
    @State private var selectedMenu = 0
    @State private var selectedMap : Bool = false
    @State private var showSheet: Bool = false
    private let menuCategories = ["음료", "푸드", "상품"]
    @StateObject var coffeeDetailViewModel = CoffeeDetailViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                topBar
                
                ScrollView{
                    coffeeListView
                }
            }
            .navigationBarHidden(true)
            
            selectStore
        }
    }

    var topBar: some View {
        VStack(alignment: .leading) {
            Text("Order")
                .font(.title)
                .bold()
                .padding(.horizontal)
            
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
                                    .fill(selected == tab ? .green01 : .clear)
                                    .frame(height: 3)
                                    .frame(minWidth: 80)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                }
                
                Spacer()
                
                Button {
                    print("cake")
                } label: {
                    VStack(spacing: 4) {
                        HStack{
                            Image("cake")
                            Text("홀케이크 예약")
                        }
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .frame(maxWidth : .infinity ,alignment: .trailing)
                        .padding(.trailing)

                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 8)
                    }
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

            
            HStack{
                ForEach(menuCategories.indices, id: \.self) { idx in
                    Button {
                        selectedMenu = idx
                    } label: {
                        HStack{
                            Text(menuCategories[idx])
                                .font(.subheadline)
                                .foregroundColor(selectedMenu == idx ? .black : .gray)
                            Image("new")
                        }
                    }
                }
                Spacer()
            }
            .font(.subheadline)
            .padding(.horizontal)
            .padding(.vertical, 8)
            
            Divider()
        }
    }
    
    var selectStore: some View{
        ZStack{
            Rectangle()
                .frame(height: 60)
                .foregroundStyle(.black01)
            
            VStack{
                Button{
                    self.showSheet.toggle()
                } label:{
                    HStack{
                        Text("주문할 매장을 선택해 주세요")
                            .foregroundStyle(.white)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Image("chevron.down")
                    }
                }
                
                Divider()
                    .frame(height: 2)
                    .background(.gray04)
            }
            .padding(.horizontal)
            .sheet(isPresented: $showSheet, content: {
                sheetView
            })
        }
    }
    
    var coffeeListView: some View {
        LazyVStack(spacing : 0){
            ForEach(coffeeDetailViewModel.coffeeDetail) { CoffeeDetail in
                NavigationLink(destination: CoffeeDetailView(coffeeDetail: CoffeeDetail)) {
                    CoffeeListView(coffeeDetail: CoffeeDetail)
                }
            }
        }
    }
    
    var sheetView: some View {
        VStack{
            Text("매장 선택")
                .frame(maxWidth: .infinity)
                .font(.callout)
                .overlay(alignment: .trailing) {
                    Button{
                        self.selectedMap.toggle()
                    }label:{
                        Image("map")
                          .padding(.leading, 4)
                    }
                }
                .padding(.top, 32)
                .padding(.horizontal)
            
            ZStack{
                Rectangle()
                    .frame(height: 28)
                    .foregroundStyle(.gray07)
                
                Text("검색")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .foregroundStyle(.gray)
            }
            .padding()
            
            HStack(spacing : 16){
                ForEach(0..<2) { idx in
                    Button {
                        selectedTab1 = idx
                    } label: {
                        VStack {
                            Text(idx == 0 ? "가까운 매장" : "자주가는 매장")
                                .font(.headline)
                                .foregroundColor(selectedTab1 == idx ? .black : .gray)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                Spacer()
            }
            .padding(.horizontal)

            Divider()
            
            if selectedMap {
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
                    }
                }
            } else {
                List(sortedStores) { store in
                    HStack {
                        Image("store_info")
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(store.name)
                                .font(.subheadline).bold()
                            Text(store.address)
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            switch store.category {
                            case "DT 매장":
                                Image("DTStore")
                            case "리저브 매장":
                                Image("ReserveStore")
                            default:
                                EmptyView()
                            }
                        }
                        
                        Spacer()
                        
                        if let userLoc = locMgr.lastLocation {
                            let storeLoc = CLLocation(
                                latitude: store.coordinate.latitude,
                                longitude: store.coordinate.longitude
                            )
                            let distKm = userLoc.distance(from: storeLoc) / 1000
                            Text(String(format: "%.1fkm", distKm))
                                .font(.caption2)
                                .foregroundColor(.gray)
                        } else {
                            Text("---")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
            }
            
        }
        .presentationDragIndicator(.visible)
    }
    
    private var sortedStores: [Store] {
        guard let userLoc = locMgr.lastLocation else {
            return vm.stores
        }
        return vm.stores.sorted { a, b in
            let la = CLLocation(latitude: a.coordinate.latitude,
                                longitude: a.coordinate.longitude)
            let lb = CLLocation(latitude: b.coordinate.latitude,
                                longitude: b.coordinate.longitude)
            return userLoc.distance(from: la) < userLoc.distance(from: lb)
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
    OrderView()
}
