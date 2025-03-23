//
//  BottomLineTextFieldStyle.swift
//  Starbucks
//
//  Created by 김도연 on 3/23/25.
//

import SwiftUI

struct BottomLineTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<_Label>) -> some View {
    VStack(spacing: 2) {
      configuration
      
      Divider()
    }
  }
}
