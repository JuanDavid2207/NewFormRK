//
//  PDFManager.swift
//  surveys-example
//
//  Created by Juan David López Regalado on 27/06/24.
//

import Foundation
import ResearchKit


guard let stepResult = taskViewController.result.result(forIdentifier: "WebViewStepIdentifier") as? ORKStepResult else {
    return
}
        
if let webViewStepResult = stepResult.results?.first as? ORKWebViewStepResult, let html = webViewStepResult.htmlWithSignature {
    let htmlFormatter = ORKHTMLPDFWriter()
            
    htmlFormatter.writePDF(fromHTML: html) { data, error in
       let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("consentTask")
            .appendingPathExtension("pdf")
        try? data.write(to: pdfURL)
    }
}
