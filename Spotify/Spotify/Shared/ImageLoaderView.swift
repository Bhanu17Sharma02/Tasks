//
//  ImageLoaderView.swift
//  Spotify
//
//  Created by Bhanu Sharma on 14/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
   
    var url = Constant.url
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: url))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
            .clipped()
        
        
    }
}

#Preview {
    ImageLoaderView()
        //.cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
