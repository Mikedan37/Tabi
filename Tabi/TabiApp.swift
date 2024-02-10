//
//  TabiApp.swift
//  Tabi
//
//  Created by Michael Danylchuk on 1/28/24.
//

import SwiftUI

@main
struct TabiApp: App {
    @StateObject var names = nameArr()
    @StateObject var ite = Item()
    @StateObject var teb = Tab()
    var body: some Scene {
        WindowGroup {
            FrontPageView().environmentObject(names).environmentObject(ite).environmentObject(teb)
        }
    }
}
