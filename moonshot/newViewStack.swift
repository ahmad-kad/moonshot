//
//  newViewStack.swift
//  moonshot
//
//  Created by ahmad kaddoura on 1/18/24.
//

// Multiple nagivation links creates new "windows"

import SwiftUI

struct newViewStack: View {
    var body: some View {
        NavigationStack{
            HStack{
                Spacer()
                NavigationLink("TB1 "){
                    Text("Detail View")
                }
                .navigationTitle("Swift UI")
                .fontWeight(.semibold)
                Spacer()
                NavigationLink("TB 2"){
                    Text("One View")
                        .fontWeight(.bold)
                }
                .navigationTitle("Swift UI")
                Spacer()
                NavigationLink{
                    Text("Rows of :) View")
                    List(0..<10){row in
                        NavigationLink("Row \(row)"){
                            Text("Contents of row \(row)")
                                .padding()
                        }
                    }
                }label:{
                    HStack{
                        //Text("This is a custom Label")
                        Image(systemName: "face.smiling")
                    }
                    .font(.headline)
                }
                Spacer()
            }
            List(0..<100){row in
                NavigationLink("Row \(row)"){
                    Text("Contents of row \(row)")
                }
            }
            
                
        }
    }

}

#Preview {
    newViewStack()
}
