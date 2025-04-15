//
//  PDFViewerViewModel.swift
//  PDFKitViewer
//
//  Created by Arun M on 15/04/25.
//

import Foundation
import PDFKit

/// ViewModel to manage the state and display options for the PDF viewer
class PDFViewerViewModel: ObservableObject {
    /// Published properties so the UI can reactively update when values change
    @Published var displayMode: PDFDisplayMode = .singlePageContinuous
    @Published var displayDirection: PDFDisplayDirection = .vertical
    @Published var usePaging: Bool = false

    /// Computed property that returns the URL of the sample PDF stored in the app bundle
    var pdfURL: URL? {
        Bundle.main.url(forResource: "sample", withExtension: "pdf")
    }
}

