//
//  ShowRowCell.swift
//  Spotify
//
//  Created by Bhanu Sharma on 25/04/24.
//

import SwiftUI

struct ShowRowCell: View {
    
    var imageSize: CGFloat = 50
    var imageName: String = Constant.url
    var title: String = "Some song name goes here"
    var subTitle: String? = "Song artist name"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 8) {
            
            ImageLoaderView(url: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.spotifyWhite)
                
                if let subTitle {
                    Text(subTitle)
                        .font(.callout)
                        .foregroundColor(.spotifyLightGray)
                }
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .onTapGesture {
            onCellPressed?()
        }
        .background(.black.opacity(0.001))
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack {
            ShowRowCell()
            ShowRowCell()
            ShowRowCell()
            ShowRowCell()
            ShowRowCell()
        }
        
    }
  
}
