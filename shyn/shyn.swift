//
//  SwiftCoinApp.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/21/21.
//

import SwiftUI
import Firebase

@main
struct SwiftCoinApp: App {
    @StateObject private var viewModel = HomeViewModel()
    @StateObject private var authViewModel = AuthViewModel.shared
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(viewModel)
            .environmentObject(authViewModel)
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                print("Active")
            } else if newPhase == .inactive {
                print("Inactive")
            } else if newPhase == .background {
                print("Background")
            }
        }
    }
}
