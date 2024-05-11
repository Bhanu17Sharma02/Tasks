//
//  SpotifyApp.swift
//  Spotify
//
//  Created by Bhanu Sharma on 14/04/24.
//

import SwiftUI
import SwiftfulRouting

@main
struct SpotifyApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
           
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
