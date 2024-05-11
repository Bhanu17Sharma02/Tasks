//
//  ContentView.swift
//  AcharyaFoundation
//
//  Created by Bhanu Sharma on 11/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ImageViewModel()
    var body: some View {
        ScrollView {
          LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                listView
            }
        }
        .onAppear {
            Task{
                await viewModel.loadImage()
            }
        }
    }
    
    @ViewBuilder var listView: some View {
        ForEach(viewModel.urlList,id:\.self){ response in
            let url = "\(response.thumbnail.domain)/\(response.thumbnail.basePath)/0/\(response.thumbnail.key)"
                ImagesView(url:url)
        }
    }
}

#Preview {
    ContentView()
}
