//
//  SpotifyCategoryCell.swift
//  Spotify
//
//  Created by Bhanu Sharma on 14/04/24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title: String = "Music"
    var isSelected: Bool = false
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColor(isSelected: isSelected)
//            .background(isSelected ? .spotifyBlackGreen: .spotifyDarkGray)
//            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite )
            .cornerRadius(16)
    }
}

extension View {
    
    func themeColor( isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyBlackGreen: .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite )

    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack(spacing: 10) {
            SpotifyCategoryCell(title: "Title Goes here")
            SpotifyCategoryCell(title: "Music", isSelected: true)
            SpotifyCategoryCell(title: "Title Goes here", isSelected: true)
        }
    }
    
}
