//
//  SpotifyRecentCell.swift
//  Spotify
//
//  Created by Bhanu Sharma on 15/04/24.
//

import SwiftUI

struct SpotifyRecentCell: View {
    
    var image: String = Constant.url
    var title: String = "Some random title"
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(url: image)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColor(isSelected: false)
        .cornerRadius(6)
        
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack
            .ignoresSafeArea()
        VStack {
            HStack{
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
            HStack{
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
        }
    }
   
    
}
