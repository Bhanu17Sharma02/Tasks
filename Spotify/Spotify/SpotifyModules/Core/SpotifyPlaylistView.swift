//
//  SpotifyPlaylistView.swift
//  Spotify
//
//  Created by Bhanu Sharma on 18/04/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    
    @Environment(\.router) var router
    
    var product: Product = Product.mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    @State private var showHeader: Bool = false
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12){
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subTitle: product.brand,
                        image: product.thumbnail
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                    
                    PlaylistDescrptionCell(
                        description: product.description,
                        userName: user.firstName,
                        subheadline: product.category) {
                            
                        } onDownloadPressed: {
                    
                        } onSharePressed: {
                            
                        } onEllipsisPressed: {
                            
                        } onShufflePressed: {
                            
                        } onPlayPressed: {
                            
                        }
                        .padding(.horizontal, 16)
                    
                    ForEach(products) { product in
                        ShowRowCell(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subTitle: product.brand) {
                                    goToPlaylistView(product: product)
                            } onEllipsisPressed: {
                                
                            }
                            .padding(.leading, 16)
                        
                    }
                }
                
            }
            .scrollIndicators(.hidden)
            
            ZStack {
                Text(product.title)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.spotifyBlack)
                    .offset(y: showHeader ? 0 : -40)
                    .opacity( showHeader ? 1 : 0)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(showHeader ? Color.spotifyBlack.opacity(0.001): .spotifyDarkGray.opacity(0.7))
                    .frame(alignment: .leading)
                    .clipShape(Circle())
                    .onTapGesture {
                        router.dismissScreen()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
            }
            .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.2), value: showHeader)
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .top)
                
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do{
            products = try await Array(DataBaseHelper().getProduct().prefix(8))
        } catch {
            
        }
    }
    
    private func goToPlaylistView(product: Product) {
        
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
    }
    
}

#Preview {
    RouterView {  _ in
        SpotifyPlaylistView()
    }
    
}
