//
//  YouTubePlayerView.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI
import WebKit

struct YouTubePlayerView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.clipsToBounds = true
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let htmlString = """
        <!DOCTYPE html>
        <html>
        <head>
        <style>
        body {
            margin: 0;
            padding: 0;
            background-color: transparent;
        }
        iframe {
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
        }
        </style>
        </head>
        <body>
        <iframe src="https://www.youtube.com/embed/\(videoID)?playsinline=1"
                frameborder="0"
                allowfullscreen>
        </iframe>
        </body>
        </html>
        """
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
}
