//
//  LutokMobileApp.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 29.03.2024.
//

import SwiftUI

@main
struct LutokMobileApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
