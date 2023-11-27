//
//  WebView.swift
//  H4X0R News SwiftUI
//
//  Created by Giorgi Goginashvili on 11/27/23.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let safeString = urlString else { return }
        guard let url = URL(string: safeString) else { return }
        DispatchQueue.global().async {
            let request = URLRequest(url: url)
            DispatchQueue.main.async {
                uiView.load(request)
            }
        }
    }
    
}
