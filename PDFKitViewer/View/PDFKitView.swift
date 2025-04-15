//
//  PDFKitView.swift
//  PDFKitViewer
//
//  Created by Arun M on 15/04/25.
//

import Foundation
import SwiftUI
import PDFKit

struct PDFKitViewRepresentable: UIViewRepresentable {
    let url: URL
    let displayMode: PDFDisplayMode
    let displayDirection: PDFDisplayDirection
    let usePageViewController: Bool

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        configure(pdfView)
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        configure(uiView)
    }

    private func configure(_ pdfView: PDFView) {
        pdfView.displayMode = displayMode
        pdfView.displayDirection = displayDirection
        pdfView.usePageViewController(usePageViewController, withViewOptions: nil)

        if pdfView.document == nil {
            pdfView.document = PDFDocument(url: url)
        }
    }
}

