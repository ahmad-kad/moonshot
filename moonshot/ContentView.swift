//
//  ContentView.swift
//  moonshot
//
//  Created by ahmad kaddoura on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showResizeImage = false
    @State private var showScrollView = false
    @State private var showNewViewStack = false
    @State private var showCodableData = false
    @State private var showGrids = false
    
    var body: some View {
        VStack{
            NavigationView {
                VStack {
                    Button("Resize"){
                        showResizeImage = true
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.white)
                    .sheet(isPresented: $showResizeImage){
                        resizeImage()
                        
                    }
                    
                    Button("show scroll view"){
                        showScrollView = true
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.white)
                    .sheet(isPresented: $showScrollView){
                        scrollView()
                    }
                    
                    Button("View Stack view"){
                        showNewViewStack = true
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.white)
                    .sheet(isPresented: $showNewViewStack){
                        newViewStack()
                    }
                    
                    Button("Codable view"){
                        showCodableData = true
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.white)
                    .sheet(isPresented: $showCodableData){
                        CodeableData()
                    }
                    
                    Button("Grids view"){
                        showGrids = true
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.white)
                    .sheet(isPresented: $showGrids){
                        grids()
                    }
                    NavigationLink{
                        astronautProj()
                    }label:{
                        Text("Moonshot APP")
                            .padding()
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    
                    
                }
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                   .navigationTitle("MoonShot")
                   .padding(10)
               }
            
            
           
            
        }
        
    }
    
}


#Preview {
    ContentView()
}
