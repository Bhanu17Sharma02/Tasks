//
//  PlaylistHeaderCell.swift
//  Spotify
//
//  Created by Bhanu Sharma on 18/04/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    
    var height: CGFloat = 300
    var title: String = "Some Title"
    var subTitle: String = "Some Subtitle"
    var image: String = Constant.url
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(url: image)
            }
        
            .overlay(alignment: .bottomLeading, content: {
                
                VStack (alignment: .leading, spacing: 8 ) {
                    Text(subTitle)
                        .font(.headline)
                    
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(colors: [shadowColor.opacity(0),shadowColor], startPoint: .top, endPoint: .bottom)
                )
                
            }
            )
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        ScrollView{
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
    
}
