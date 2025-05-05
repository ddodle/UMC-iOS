//
//  photoDetailView.swift
//  Starbucks
//
//  Created by 김도연 on 5/5/25.
//

import SwiftUI

struct PhotoDetailView: View {
    let uiImage: UIImage?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.black.opacity(0.7).ignoresSafeArea()
            if let img = uiImage {
                Image(uiImage: img)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .overlay(
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: { dismiss() }) {
                                    Image("Xmark")
                                        .font(.largeTitle)
                                        .padding()
                                        .foregroundStyle(.gray05)
                                        .padding()
                                }
                            }
                            Spacer()
                        }
                    )
            }
        }
    }
}
