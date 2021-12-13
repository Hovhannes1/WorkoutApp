//
//  AppTabsView.swift
//  WorkoutApp
//
//  Created by stepanyan hovhannes on 16/11/2021.
//

import SwiftUI

struct AppTabsView: View {
    @EnvironmentObject var dataModel : WorkoutViewModel
    var body: some View {
        TabView {
            TimerView()
                .tabItem{
                    Image(systemName: "timer")
                    Text("Timer")
                }
            WorkoutView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("Workout")
                }
                .disabled(dataModel.workouts.count == 0)
            ProfileView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profil")
                }
        }
    }
}

struct AppTabsView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabsView().environmentObject(WorkoutViewModel())
    }
}
