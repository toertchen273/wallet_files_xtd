//
//  LazyNavigationView.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/26/21.
//

import SwiftUI

struct LazyNavigationView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
