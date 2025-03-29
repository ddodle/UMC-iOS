//
//  AdView.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import SwiftUI

struct AdView: View{
    @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        VStack{
            Image("ad")
                .resizable()
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            buttons
        }
    }
    
    var buttons: some View{
        VStack(spacing: 12){
            Button(action: {
                print("자세히보기")
            }, label: {
              Text("자세히보기")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
            .frame(height: 48)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(.green00)
            
            HStack{
                Spacer()

                Button(action: {
                    print("dismiss")
                    dismiss()
                }, label: {
                    Text("X 닫기")
                        .foregroundColor(.gray)
                        .font(.body)
                })
            }
        }
        .padding()
    }
}

#Preview {
    AdView()
}
