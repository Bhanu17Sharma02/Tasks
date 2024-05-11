//
//  ImageTitleRowCell.swift
//  Spotify
//
//  Created by Bhanu Sharma on 17/04/24.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var imageSize: CGFloat = 100
    var imageName: String = Constant.url
    var title: String = "Some Random Title"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            ImageLoaderView(url: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize, height: imageSize)
        
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ImageTitleRowCell()
    }
}
