//
//  grids.swift
//  moonshot
//
//  Created by ahmad kaddoura on 1/18/24.
//

import SwiftUI

struct grids: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 100))
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: layout){
                ForEach(0..<101){
                    Text("\($0)")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    grids()
}
