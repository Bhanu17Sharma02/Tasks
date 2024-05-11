//
//  ContentView.swift
//  Spotify
//
//  Created by Bhanu Sharma on 14/04/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
//    @State private var users: [User] = []
//    @State private var products: [Product] = []
    
    var body: some View {
        VStack {
            Button( "Tour of Spotify Clone") {
                router.showScreen(.fullScreenCover) { _ in
                    SpotifyHomeView()
                }
               
            }
//            ForEach(users) { product in
//                Text( product.firstName )
//            }
//            .foregroundStyle(.spotifyBlackGreen)
        }
       // .padding()
//        .task {
//            await getData()
//        }
    }
    
//    private func getData() async {
//        do{
//            users = try await DataBaseHelper().getUser()
//            products = try await DataBaseHelper().getProduct()
//        } catch {
//            
//        }
//    }
}

#Preview {
    RouterView{ _ in
        ContentView()
    }
    
}
