//
//  IconButton.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import SwiftUI

struct IconButton: View {
    let title: String
    let imageName: String
    
    var body: some View {
        Group{
            VStack{
                Image(imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                Text(title)
                    .foregroundStyle(.black02)
            }
            .padding()
        }
        .background(.white)
        .cornerRadius(20)
        
    }
}

#Preview {
    IconButton(title: "별 히스토리", imageName: "star_history")
}
