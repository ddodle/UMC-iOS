//
//  ReceiptsModel.swift
//  Starbucks
//
//  Created by 김도연 on 5/5/25.
//

import Foundation
import SwiftData

@Model
class ReceiptsModel{
    @Attribute(.unique) var id: UUID
    
    var store: String
    var totalAmount: Int
    var createdAt: Date
    
    @Attribute(.externalStorage) var imageData : Data?
    
    init(
        store: String,
        totalAmount: Int,
        createdAt: Date = Date()
    ) {
        self.id = UUID()
        self.store = store
        self.totalAmount = totalAmount
        self.createdAt = createdAt
    }
}
