//
//  marcadortrucoApp.swift
//  marcadortruco
//
//  Created by Gabriel on 25/12/22.
//

import SwiftUI

@main
struct marcadortrucoApp: App {
    @StateObject var dadosTimes = DadosTimes()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(dadosTimes)
        }
    }
}
