//
//  PDFViewerViewModel.swift
//  PDFKitViewer
//
//  Created by Arun M on 15/04/25.
//

import Foundation
import PDFKit

class PDFViewerViewModel: ObservableObject {
    @Published var displayMode: PDFDisplayMode = .singlePageContinuous
    @Published var displayDirection: PDFDisplayDirection = .vertical
    @Published var usePaging: Bool = false

    var pdfURL: URL? {
        Bundle.main.url(forResource: "sample", withExtension: "pdf")
    }
}

