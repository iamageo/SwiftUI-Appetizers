//
//  AppetizersListView.swift
//  SwiftUI-Appetizers
//
//  Created by Geovani Amaral on 20/11/24.
//

import SwiftUI

struct AppetizersListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListItem(appetizer: appetizer)
                }
                .navigationTitle("Appetizers 🍉")
            }
            .onAppear() {
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            
        }.alert(item: $viewModel.alertItem) { item in
            Alert(title: item.title,
                  message: item.message,
                  dismissButton: item.dismissButton)
        }
    }
}

#Preview {
    AppetizersListView()
}
