//
//  AppTabsView.swift
//  WorkoutApp
//
//  Created by stepanyan hovhannes on 16/11/2021.
//

import SwiftUI

struct AppTabsView: View {
    var body: some View {
        TabView {
            TimerView()
                .tabItem{
                    Image(systemName: "dollarsign.square")
                    Text("Timer")
                }
            WorkoutView()
                .tabItem{
                    Image(systemName: "chart.bar")
                    Text("Workout")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "chart.bar")
                    Text("Profil")
                }
        }
    }
}

struct AppTabsView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabsView()
    }
}
