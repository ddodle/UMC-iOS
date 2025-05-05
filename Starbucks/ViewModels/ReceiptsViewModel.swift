//
//  ReceiptsViewModel.swift
//  Starbucks
//
//  Created by 김도연 on 5/5/25.
//

import SwiftUI
import Vision
import UIKit

class ReceiptsViewModel: ObservableObject {
    @Published var selectImage: UIImage?
    @Published var isShowingPicker = false
    @Published var isShowingActionSheet = false
    @Published var pickerSource: UIImagePickerController.SourceType = .photoLibrary

    func performOCR(on image: UIImage, completion: @escaping (String) -> Void) {
        guard let cgImage = image.cgImage else {
            completion("")
            return
        }
        let request = VNRecognizeTextRequest { request, error in
            guard error == nil else {
                completion("")
                return
            }
            let text = request.results?
                .compactMap { ($0 as? VNRecognizedTextObservation)?
                    .topCandidates(1).first?.string }
                .joined(separator: "\n") ?? ""
            completion(text)
        }
        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko","en"]
        request.usesLanguageCorrection = true

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        DispatchQueue.global(qos: .userInitiated).async {
            try? handler.perform([request])
        }
    }

    func parseReceipt(_ text: String) -> (store: String, date: Date, amount: Int) {
        let lines = text.split(separator: "\n").map(String.init)
        let store = lines.first ?? "알 수 없음"

        var date = Date()
        if lines.count >= 2 {
            let df = DateFormatter()
            df.locale = Locale(identifier: "ko_KR")
            df.dateFormat = "yyyy.MM.dd HH:mm"
            if let d = df.date(from: lines[1]) {
                date = d
            }
        }

        let amount = lines.compactMap { line in
            line
              .replacingOccurrences(of: ",", with: "")
              .firstMatch(of: #/\d+원/#)?
              .output
              .dropLast()
              .description
        }
        .first
        .flatMap(Int.init) ?? 0

        return (store, date, amount)
    }
}
