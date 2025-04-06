//
//  WhatsNewModel.swift
//  Starbucks
//
//  Created by 김도연 on 4/6/25.
//

import Foundation

struct WhatsNew: Identifiable{
    var id = UUID()
    var title: String
    var detail: String
    var imageName: String
}
