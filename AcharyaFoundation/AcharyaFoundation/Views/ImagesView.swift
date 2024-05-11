//
//  ImagesView.swift
//  AcharyaFoundation
//
//  Created by Bhanu Sharma on 11/05/24.
//

import SwiftUI
import UIKit

struct ImagesView: View {
    
    var url : String
    @StateObject var viewModel: ImageLoader = ImageLoader()
    
    var body: some View {

        VStack {
            
            if let image = viewModel.image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                           
                    } else {
                        ProgressView()
                    }
            
// Here you can compare with AsyncImage as well but i found out other way can customize the loading image but we can't do this AsyncImage
//                AsyncImage(url: URL(string: url)!) { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                    
//                } placeholder: {
//                    ProgressView()
//                }                
        }
        .frame(alignment: .center)
        .padding()
        .onAppear{
            viewModel.loadImage(url: url)
        }

    }
}

#Preview {
    ImagesView(url: "https://cimg.acharyaprashant.org/images/img-c7d089b3-8be2-4b25-acdd-25b50a1d683b/0/image.jpg")
}
