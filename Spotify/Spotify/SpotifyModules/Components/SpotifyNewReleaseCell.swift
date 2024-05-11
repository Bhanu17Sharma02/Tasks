//
//  SpotifyNewRelease.swift
//  Spotify
//
//  Created by Bhanu Sharma on 15/04/24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var image: String = Constant.url
    var headline: String? = "New release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8){
                ImageLoaderView(url: image)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    
                        if let subheadline {
                            Text(subheadline)
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundStyle(.spotifyWhite)
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                ImageLoaderView(url: image)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32){
                    VStack(alignment: .leading, spacing: 2){
                        if let title {
                            Text(title)
                                .foregroundStyle(.spotifyWhite)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                            
                    }
                }
                .padding(.trailing, 16)
                
                
            }
            .themeColor(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayPressed?()
            }
            
            
        }
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
    }
}
