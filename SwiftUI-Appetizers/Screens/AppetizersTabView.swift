//
//  ContentView.swift
//  SwiftUI-Appetizers
//
//  Created by Geovani Amaral on 20/11/24.
//

import SwiftUI

struct AppetizersTabView: View {
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem{
                    Image(systemName: "house")
                    Text("House")
                }
            
            AccountView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem{
                    Image(systemName: "bag")
                    Text("Order")
                }
        }.accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizersTabView()
}
