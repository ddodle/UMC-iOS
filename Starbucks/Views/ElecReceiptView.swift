//
//  ElecReceiptView.swift
//  Starbucks
//
//  Created by 김도연 on 4/29/25.
//

import SwiftUI

struct ElecReceiptView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.white00
                .ignoresSafeArea()
            
            VStack {
                ReceiptView
                    .padding()
                
                ScrollView{
                    
                    ReceiptInfoView
                    
                    Spacer()

                }
                .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(Text("전자 영수증").font(.body))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image("back1")
                        .font(.title)
                        .tint(.black)
                })
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image("Plus")
                        .font(.title)
                        .tint(.black)
                })
            }
        }
    }
    
    var ReceiptView: some View{
        VStack{
            HStack{
                Text("총 1건")
                
                Spacer()
                
                Text("사용합계 10,000원")
            }
        }
    }
    
    var ReceiptInfoView: some View{
        VStack{
            Text("hi")
            
            Spacer()
        }
    }
}

#Preview {
    ElecReceiptView()
}
