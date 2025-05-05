//
//  ElecReceiptView.swift
//  Starbucks
//
//  Created by 김도연 on 4/29/25.
//

import SwiftUI
import SwiftData
import UIKit

struct ElecReceiptView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Query(sort: \ReceiptsModel.createdAt, order: .reverse) private var receipts: [ReceiptsModel]

    @StateObject private var vm = ReceiptsViewModel()
    @State private var showPhotoDetail = false

    init() {}

    var body: some View {
        VStack(spacing: 0) {
            ReceiptNavBar(onBack: { dismiss() }, onAdd: { vm.isShowingActionSheet.toggle() })
            Divider()
            ReceiptHeader(count: receipts.count, total: receipts.reduce(0) { $0 + $1.totalAmount })
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(receipts) { r in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(r.store)
                                    .font(.callout)
                                    .bold()
                                Text(r.createdAt, format: .dateTime.year().month().day().hour().minute())
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("\(r.totalAmount)원")
                                    .font(.headline)
                                    .foregroundStyle(.brown01)
                            }
                            Spacer()
                            Button {
                                vm.selectImage = r.imageData.flatMap(UIImage.init(data:))
                                showPhotoDetail = true
                            } label: {
                                Image("dollarSign")
                                    .font(.title2)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
        }
        .confirmationDialog("영수증을 어떻게 추가할까요?", isPresented: $vm.isShowingActionSheet) {
            Button("앨범에서 가져오기") {
                vm.pickerSource = .photoLibrary
                vm.isShowingPicker = true
            }
            Button("카메라로 촬영하기") {
                vm.pickerSource = .camera
                vm.isShowingPicker = true
            }
            Button("취소", role: .cancel) {}
        }
        .sheet(isPresented: $vm.isShowingPicker) {
            ImagePicker(selectedImage: $vm.selectImage, isPresented: $vm.isShowingPicker, sourceType: vm.pickerSource)
        }
        .fullScreenCover(isPresented: $showPhotoDetail) {
            PhotoDetailView(uiImage: vm.selectImage)
        }
        .onChange(of: vm.selectImage) { _, anyObj in
            guard let uiImg = anyObj,
                  let data  = uiImg.jpegData(compressionQuality: 0.8)
            else { return }
            let newR = ReceiptsModel(store: "알 수 없음",
                                         totalAmount: 0,
                                         createdAt: Date())
            newR.imageData = data
            context.insert(newR)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ReceiptNavBar: View {
    let onBack: () -> Void
    let onAdd: () -> Void

    var body: some View {
        HStack {
            Button(action: onBack) {
                Image("back1")
            }
            Spacer()
            Text("전자영수증")
                .font(.headline)
            Spacer()
            Button(action: onAdd) {
                Image("Plus")
            }
        }
        .padding()
    }
}

struct ReceiptHeader: View {
    let count: Int
    let total: Int

    var body: some View {
        HStack {
            Text("총")
            Text("\(count)건")
                .foregroundStyle(.brown01)
            Spacer()
            Text("사용합계")
            Text("\(total.formatted())원")
                .foregroundStyle(.brown01)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

#Preview {
    ElecReceiptView()
}
