//
//  YouTubeScrollView.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI

struct YouTubeScrollView: View {
    let videoIDs = ["0PEUgYUfyH0", "sYuj3nw6008", "9E51scGeGUJZIAZs",""]

    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(videoIDs, id: \.self) { id in
                        YouTubePlayerView(videoID: id)
                            .frame(width: 150, height: 100)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                }
                .padding()
            }
        }
}
