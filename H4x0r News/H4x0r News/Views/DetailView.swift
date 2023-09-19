//
//  DetailView.swift
//  H4x0r News
//
//  Created by Tatiane Silva on 19/09/23.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable {

    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString, let url = URL(string: safeString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
