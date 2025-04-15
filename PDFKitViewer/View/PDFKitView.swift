//
//  PDFKitView.swift
//  PDFKitViewer
//
//  Created by Arun M on 15/04/25.
//

import Foundation
import SwiftUI
import PDFKit

/// Wrapper for PDFKit's PDFView to make it compatible with SwiftUI
struct PDFKitViewRepresentable: UIViewRepresentable {
    let url: URL
    let displayMode: PDFDisplayMode
    let displayDirection: PDFDisplayDirection
    let usePageViewController: Bool
    
    // Create the PDFView instance when the view is first created
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true // Ensures the PDF content fits the screen
        configure(pdfView) // Apply the configuration settings to the PDFView
        return pdfView
    }
    
    // Update the PDFView when the SwiftUI view changes
    func updateUIView(_ uiView: PDFView, context: Context) {
        configure(uiView) // Reapply settings in case they change
    }
    
    // Helper method to configure the PDFView based on the current state
    private func configure(_ pdfView: PDFView) {
        pdfView.displayMode = displayMode // Set the display mode
        pdfView.displayDirection = displayDirection // Set the scrolling direction
        pdfView.usePageViewController(usePageViewController, withViewOptions: nil) // Enable paging if needed
        
        if pdfView.document == nil {
            pdfView.document = PDFDocument(url: url) // Load the PDF document if not already loaded
        }
    }
}
