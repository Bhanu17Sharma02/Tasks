//
//  SpotifyHomeView.swift
//  Spotify
//
//  Created by Bhanu Sharma on 14/04/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyHomeView: View {
    
    @Environment(\.router) var router
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]){
                    Section {
                        VStack(spacing: 16){
                            recentSection
                            
                            if let firstProduct = products.first {
                                newRealseSection(product: firstProduct)
                                    .padding(.horizontal, 16)
                            }
                            
                            listRows
                        }
                        //.padding(.horizontal, 16)
                        
//                        ForEach(0..<20) { _ in
//                            Rectangle()
//                                .fill(.red)
//                                .frame(width: 200, height: 200)
//                        }
                    } header: {
                        header
                    }

                }
                .padding(.top, 8)
                }
                .scrollIndicators(.hidden)
                .clipped()

        }
        .task {
            await getData()
        }
        
        .toolbar(.hidden, for: .navigationBar)
        
    }
    
    private func getData() async {
        guard  products.isEmpty else{
            return
        }
        
        do{
            currentUser = try await DataBaseHelper().getUser().first
            products = try await Array(DataBaseHelper().getProduct().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand })
            for brand in allBrands {
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
        } catch {
            
        }
    }
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(url: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
                            print("check")
                        }
                }
            }
            .frame(width: 35, height: 35)
           
            
            ScrollView(.horizontal){
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
                
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(Color.spotifyBlack)
        
    }
    
    private var recentSection: some View {
        
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentCell(image: product.firstImage, title: product.title)
                    .asButton(.press) {
                        goToPlaylistView(product: product)
                    }
            }
        }
    }
    
    private func goToPlaylistView(product: Product) {
        guard let currentUser else {
            return
        }
        
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: currentUser)
        }
    }
    
    private func newRealseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            image: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description) {
                
            } onPlayPressed: {
                goToPlaylistView(product: product)
            }
    }
    
    private var listRows: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal){
                    HStack(alignment: .top, spacing: 8){
                        ForEach(row.products) { product in
                            ImageTitleRowCell(imageSize: 120, imageName: product.firstImage, title: product.title)
                                .padding(.bottom,30)
                                .asButton(.press) {
                                    goToPlaylistView(product: product)
                                }
                        }
        
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
               
            }

        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyHomeView()
    }
  
}
