//
//  SwiftUIFormApp.swift
//  SwiftUIForm
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct SwiftUIFormApp: App {
    
    
    // Registramos antes que nada AppDelegate, para que primero se llame a FirebaseApp.configure()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var almacenInicial = SettingStore()
    
    // Crear una instancia de RestaurantViewModel y pasarle el almacen
    let viewModel = RestaurantViewModel(almacen: SettingStore())
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel).environmentObject(almacenInicial)
        }
    }
}
