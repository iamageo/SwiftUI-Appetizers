//
//  AppetizerListItem.swift
//  SwiftUI-Appetizers
//
//  Created by Geovani Amaral on 23/11/24.
//

import SwiftUI

struct AppetizerListItem: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            
            AppetizerRemoteImage(urlString: appetizer.imageURL!)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
            }.padding(.leading)
        }
    }
}

#Preview {
    AppetizerListItem(appetizer: MockData.sampleAppetizer)
}
