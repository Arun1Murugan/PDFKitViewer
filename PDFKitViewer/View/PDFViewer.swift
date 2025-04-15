//
//  PDFViewer.swift
//  PDFKitViewer
//
//  Created by Arun M on 15/04/25.
//

import SwiftUI
import PDFKit

struct PDFViewer: View {
    @StateObject private var viewModel = PDFViewerViewModel() // Instantiate the ViewModel

    var body: some View {
        VStack {
            if let url = viewModel.pdfURL {
                PDFKitViewRepresentable(
                    url: url,
                    displayMode: viewModel.displayMode,
                    displayDirection: viewModel.displayDirection,
                    usePageViewController: viewModel.usePaging
                )
            } else {
                Text("PDF not found")
            }

            Divider()

            VStack(spacing: 8) {
                Picker("Display Mode", selection: $viewModel.displayMode) {
                    Text("Single Page").tag(PDFDisplayMode.singlePage)
                    Text("Continuous").tag(PDFDisplayMode.singlePageContinuous)
                    Text("Two-up").tag(PDFDisplayMode.twoUp)
                }
                .pickerStyle(.segmented)

                Picker("Direction", selection: $viewModel.displayDirection) {
                    Text("Vertical").tag(PDFDisplayDirection.vertical)
                    Text("Horizontal").tag(PDFDisplayDirection.horizontal)
                }
                .pickerStyle(.segmented)

                Toggle("Use Paging", isOn: $viewModel.usePaging)
            }
            .padding()
        }
        .navigationTitle("PDF Viewer")
        .navigationBarTitleDisplayMode(.inline)
    }
}

