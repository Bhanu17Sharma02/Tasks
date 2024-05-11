//
//  PlaylistDescrptionCell.swift
//  Spotify
//
//  Created by Bhanu Sharma on 18/04/24.
//

import SwiftUI

struct PlaylistDescrptionCell: View {
    
    var `description`: String = Product.mock.description
    var userName: String = "Bhanu"
    var subheadline: String = "Some random headline"
    var onAddToPlayPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil


    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(description)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            madeForYouSection
            
            Text(subheadline)
            
            buttonsRow
            
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    private var madeForYouSection: some View {
        HStack(spacing: 8){
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyBlackGreen)
            
            Text("Made for ")
            +
            Text(userName)
                .bold()
                .foregroundStyle(.spotifyWhite)
        }
        
    }
    
    private var buttonsRow: some View {
        HStack(spacing: 0){
            HStack(spacing: 0){
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        onAddToPlayPlaylistPressed?()
                    }
                
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        onDownloadPressed?()
                    }
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        onSharePressed?()
                    }
                
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        onEllipsisPressed?()
                    }
            }
            .offset(x:-8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack(spacing: 8) {
                Image(systemName: "shuffle")
                    .background(.black.opacity(0.001))
                    .font(.system(size: 24))
                    .onTapGesture {
                        onShufflePressed?()
                    }
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .foregroundStyle(.spotifyBlackGreen)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        onPlayPressed?()
                    }
            }
        }
        .font(.title2)
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        PlaylistDescrptionCell()
    }
   
}
